From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [REGRESSION stable] "of: fix handling of '/' in options for of_find_node_by_path()"
 breaks stdout-path
Date: Tue, 17 Mar 2015 14:58:50 +0100
Message-ID: <5508331A.3090806@redhat.com>
References: <5506FC72.80800@redhat.com> <20150316181957.GJ4278@bivouac.eciton.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150316181957.GJ4278-t77nlHhSwNqAroYi2ySoxKxOck334EZe@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, stable <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 16-03-15 19:19, Leif Lindholm wrote:
> Hi Hans,
>
> On Mon, Mar 16, 2015 at 04:53:22PM +0100, Hans de Goede wrote:
>> While updating my local working tree to 4.0-rc4 this morning I noticed that I no longer
>> got any console (neither video output not serial console) on an Allwinner A20 ARM
>> board.
>>
>> This is caused by:
>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/drivers/of?id=106937e8ccdcf0f4b95fbf0fe9abd42766cade33
>>
>> Reverting this commit fixes the serial console being gone for me.
>
> Sorry about that.
>
>> After this there still is an issue that tty0 no longer is seen as console, where it
>> used to be properly used as console in 3.19, I'll investigate that further and send
>> a separate mail about this.
>>
>> Greg, this commit has a: "Cc: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org> # 3.19" please do not apply
>> this commit to stable!
>>
>> u-boot sets stdout-path to this value on the board in question:
>> "/soc@01c00000/serial@01c28000:115200"
>>
>> Looking at the first hunk of the patch in question, the problem is obvious:
>>
>> @@ -714,16 +714,17 @@ static struct device_node *__of_find_node_by_path(struct device_node *parent,
>>   const char *path)
>>   {
>>    struct device_node *child;
>> - int len = strchrnul(path, '/') - path;
>> - int term;
>> + int len;
>> + const char *end;
>> + end = strchr(path, ':');
>> + if (!end)
>> + end = strchrnul(path, '/');
>> +
>> + len = end - path;
>>    if (!len)
>>     return NULL;
>> - term = strchrnul(path, ':') - path;
>> - if (term < len)
>> - len = term;
>> -
>>   __for_each_child_of_node(parent, child) {
>>    const char *name = strrchr(child->full_name, '/');
>>    if (WARN(!name, "malformed device_node %s\n", child->full_name))
>>
>> The new code to determine len will match (when starting at root) the name of
>> all child nodes against: "soc@01c00000/serial@01c28000" as it checks for
>> the ":" first and then uses everything before it. Where as the old code
>> would match against: "soc@01c00000" which is the correct thing to do.
>>
>> The best fix I can come up with is to check for both ":" and "/" and use
>> the earlier one as end to calculate the length. I've not coded this out /
>> tested this due to -ENOTIME. Note that I've also not audited the rest of
>> the patch for similar issues.
>>
>> I will happily test any patches to fix this.
>
> Can you give this one a try for the first part of your problem?

I've just given the below patch a test run and it resolves the issue for me.

Thanks & Regards,

Hans


> And if you're happy with that, I can revert the previous version and
> send a new combined fix.
>
> Rob/Grant: am I OK to assume the existence of the phandle-tests
> subnode for my unrelated test?
>
> /
>      Leif
>
>  From cbb150ddd277e5fe1c109e6a675f075f0611f71d Mon Sep 17 00:00:00 2001
> From: Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Date: Mon, 16 Mar 2015 17:58:22 +0000
> Subject: [PATCH] of: fix regression in of_find_node_opts_by_path()
>
> This fixes a regression for dealing with paths that contain both a ':'
> option separator and a '/' in the path preceding it. And adds a test
> case to prove it.
>
> Fixes: 106937e8ccdc ("of: fix handling of '/' in options for of_find_node_by_path()")
> Reported-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>   drivers/of/base.c     | 10 ++++------
>   drivers/of/unittest.c |  5 +++++
>   2 files changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index adb8764..2ee7265 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -715,13 +715,11 @@ static struct device_node *__of_find_node_by_path(struct device_node *parent,
>   {
>   	struct device_node *child;
>   	int len;
> -	const char *end;
> +	const char *p1, *p2;
>
> -	end = strchr(path, ':');
> -	if (!end)
> -		end = strchrnul(path, '/');
> -
> -	len = end - path;
> +	p1 = strchrnul(path, ':');
> +	p2 = strchrnul(path, '/');
> +	len = (p1 < p2 ? p1 : p2) - path;
>   	if (!len)
>   		return NULL;
>
> diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
> index aba8946..8d94349 100644
> --- a/drivers/of/unittest.c
> +++ b/drivers/of/unittest.c
> @@ -97,6 +97,11 @@ static void __init of_selftest_find_node_by_name(void)
>   		 "option path test, subcase #1 failed\n");
>   	of_node_put(np);
>
> +	np = of_find_node_opts_by_path("/testcase-data/phandle-tests:test/option", &options);
> +	selftest(np && !strcmp("test/option", options),
> +		 "option path test, subcase #2 failed\n");
> +	of_node_put(np);
> +
>   	np = of_find_node_opts_by_path("/testcase-data:testoption", NULL);
>   	selftest(np, "NULL option path test failed\n");
>   	of_node_put(np);
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
