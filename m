From: Peter Hurley <peter@hurleysoftware.com>
Subject: Re: [PATCH] libfdt: Teach fdt_path_offset() about ':' path separator
Date: Thu, 05 Mar 2015 12:04:19 -0500
Message-ID: <54F88C93.9000405@hurleysoftware.com>
References: <1425487459-20955-1-git-send-email-peter@hurleysoftware.com> <CAL_JsqLXP8LccUXA+NNmGyCgbJSArVHCN5XvF17dkbahuook-Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqLXP8LccUXA+NNmGyCgbJSArVHCN5XvF17dkbahuook-Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andrew Lunn <andrew@lunn.ch>, Leif Lindholm <leif.lindholm@linaro.org>, Greg KH <gregkh@linuxfoundation.org>
List-Id: devicetree@vger.kernel.org

[ +cc Greg KH ]

On 03/05/2015 10:23 AM, Rob Herring wrote:
> On Wed, Mar 4, 2015 at 10:44 AM, Peter Hurley <peter@hurleysoftware.com> wrote:
>> stdout-path defines ':' as a path separator and commit 75c28c09af99a
>> ("of: add optional options parameter to of_find_node_by_path()") added
>> the necessary support to parse paths terminated with ':' path separator.
>> commit 7914a7c5651a5 ("of: support passing console options with
>> stdout-path") added options string support to the stdout-path property,
>> which broke earlycon.
>>
>> Add the same support to fdt_path_offset() so earlycon can parse and
>> process stdout-path properties containing an options string.
>>
>> Cc: Leif Lindholm <leif.lindholm@linaro.org>
>> Cc: <stable@vger.kernel.org> # 3.19+
>> Signed-off-by: Peter Hurley <peter@hurleysoftware.com>
> 
> This needs to be first applied to upstream dtc[1]. Please do a patch
> against dtc and send to devicetree-compiler list.

Sure, I can do that, but then how is this patch going to end up in
3.19-stable?

Regards,
Peter Hurley

> Rob
> 
> [1] https://git.kernel.org/cgit/linux/kernel/git/jdl/dtc.git/
> 
>> ---
>>  scripts/dtc/libfdt/fdt_ro.c | 9 +++++----
>>  1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/scripts/dtc/libfdt/fdt_ro.c b/scripts/dtc/libfdt/fdt_ro.c
>> index 02b6d68..a96e452 100644
>> --- a/scripts/dtc/libfdt/fdt_ro.c
>> +++ b/scripts/dtc/libfdt/fdt_ro.c
>> @@ -156,7 +156,8 @@ int fdt_subnode_offset(const void *fdt, int parentoffset,
>>
>>  int fdt_path_offset(const void *fdt, const char *path)
>>  {
>> -       const char *end = path + strlen(path);
>> +       const char *separator = strchr(path, ':');
>> +       const char *end = separator ? separator : path + strlen(path);
>>         const char *p = path;
>>         int offset = 0;
>>
>> @@ -166,7 +167,7 @@ int fdt_path_offset(const void *fdt, const char *path)
>>         if (*path != '/') {
>>                 const char *q = strchr(path, '/');
>>
>> -               if (!q)
>> +               if (!q || q > end)
>>                         q = end;
>>
>>                 p = fdt_get_alias_namelen(fdt, p, q - p);
>> @@ -177,7 +178,7 @@ int fdt_path_offset(const void *fdt, const char *path)
>>                 p = q;
>>         }
>>
>> -       while (*p) {
>> +       while (p < end) {
>>                 const char *q;
>>
>>                 while (*p == '/')
>> @@ -185,7 +186,7 @@ int fdt_path_offset(const void *fdt, const char *path)
>>                 if (! *p)
>>                         return offset;
>>                 q = strchr(p, '/');
>> -               if (! q)
>> +               if (!q || q > end)
>>                         q = end;
>>
>>                 offset = fdt_subnode_offset_namelen(fdt, offset, p, q-p);
>> --
>> 2.3.1
>>
