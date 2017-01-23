From: Alexander Sverdlin <alexander.sverdlin-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] of/platform: Ignore disabled devices in
 of_platform_populate()
Date: Mon, 23 Jan 2017 16:09:57 +0100
Message-ID: <34599a91-7fd8-8e08-b399-382d6c528332@nokia.com>
References: <CAL_JsqKb8KUgit-q_cOON8VgZBsrXEQd2EcC0iF=ou_271Vg_w@mail.gmail.com>
 <20170123125204.22233-1-alexander.sverdlin@nokia.com>
 <711e6067-ab41-8217-b947-2b4c356aaaba@nokia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <711e6067-ab41-8217-b947-2b4c356aaaba-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 23/01/17 15:33, Alexander Sverdlin wrote:
>> Check the status property and give up early enough. Otherwise
>> OF_POPULATED_BUS might be set for disabled bus which will prevent
>> it from being populated later (if enabled).
>>
>> Signed-off-by: Alexander Sverdlin <alexander.sverdlin-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>
>> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> ---
>>  drivers/of/platform.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
>> index 35de1fc59fa6..060621d94f1a 100644
>> --- a/drivers/of/platform.c
>> +++ b/drivers/of/platform.c
>> @@ -476,6 +476,10 @@ int of_platform_populate(struct device_node *root,
>>  	root = root ? of_node_get(root) : of_find_node_by_path("/");
>>  	if (!root)
>>  		return -EINVAL;
>> +	if (!of_device_is_available(root)) {
>> +		of_node_put(root);
>> +		return 0;
>> +	}
>>  
>>  	pr_debug("%s()\n", __func__);
>>  	pr_debug(" starting at: %s\n", root->full_name);
> no, this one also doesn't allow to switch to of_platform_default_populate(),
> please ignore the patch.

Well, the patch seems to fix a real problem because OF_POPULATED_BUS would be
set for disabled buses, which will prevent their enabling later. Even if there
is no in-tree call site stumbles upon this issue. 

-- 
Best regards,
Alexander Sverdlin.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
