MIME-Version: 1.0
In-Reply-To: <756e7632-bc0a-ae5f-f383-fbd3f0bf9135@linux.vnet.ibm.com>
References: <1520041604-24482-1-git-send-email-tyreld@linux.vnet.ibm.com>
	<20180307203847.l6jfxgizrzzwfrbr@rob-hp-laptop>
	<756e7632-bc0a-ae5f-f383-fbd3f0bf9135@linux.vnet.ibm.com>
Date: Wed, 7 Mar 2018 16:21:01 -0600
Message-ID: <CAL_JsqLZV7pSJCczoR9wr=ufkSWEKv7LrKt19Nq3DvVSB3P6pw@mail.gmail.com>
Subject: Re: [PATCH] of: get of_root directly in place of of_find_node_by_path("/")
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To: Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
Cc: Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Wed, Mar 7, 2018 at 4:14 PM, Tyrel Datwyler
<tyreld@linux.vnet.ibm.com> wrote:
> On 03/07/2018 12:38 PM, Rob Herring wrote:
>> On Fri, Mar 02, 2018 at 08:46:44PM -0500, Tyrel Datwyler wrote:
>>> There are a couple places in drivers/of where the root node is found
>>> with a of_find_node_by_path("/") call. This call just returns
>>> of_node_get(of_root) when the the path "/" is passed as a parameter.
>>> So, lets fixup these instances to just do that instead.
>>>
>>> Signed-off-by: Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
>>> ---
>>>  drivers/of/base.c     | 2 +-
>>>  drivers/of/platform.c | 4 ++--
>>>  2 files changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/of/base.c b/drivers/of/base.c
>>> index ad28de9..94c1b4d 100644
>>> --- a/drivers/of/base.c
>>> +++ b/drivers/of/base.c
>>> @@ -455,7 +455,7 @@ int of_machine_is_compatible(const char *compat)
>>>      struct device_node *root;
>>>      int rc =3D 0;
>>>
>>> -    root =3D of_find_node_by_path("/");
>>> +    root =3D of_node_get(of_root);
>>
>> The former seems more readable to me. I'll wait and see if Frank has any
>> comments on this change.
>
> Fair enough. I find them equally readable now that we have a well named/d=
efined global, namely "of_root",  pointing at the device tree root. My prim=
ary goal was saving a function call, but I wasn't sure if anybody really ca=
res enough. A quick check shows ~77 uses of "of_find_node_by_path("/")" in =
the kernel. Figured I'd start here and see what the consensus was.

As far as outside drivers/of/ is concerned, we certainly don't want to
expose global variables. But for most uses, you shouldn't need the
root node pointer because most iterating or searching functions treat
NULL as root.

Rob
