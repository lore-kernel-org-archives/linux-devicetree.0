MIME-Version: 1.0
In-Reply-To: <f2564ac8-b0c7-d61b-ebc4-91090c545486@linux.vnet.ibm.com>
References: <1520041604-24482-1-git-send-email-tyreld@linux.vnet.ibm.com>
	<20180307203847.l6jfxgizrzzwfrbr@rob-hp-laptop>
	<756e7632-bc0a-ae5f-f383-fbd3f0bf9135@linux.vnet.ibm.com>
	<CAL_JsqLZV7pSJCczoR9wr=ufkSWEKv7LrKt19Nq3DvVSB3P6pw@mail.gmail.com>
	<f2564ac8-b0c7-d61b-ebc4-91090c545486@linux.vnet.ibm.com>
Date: Thu, 8 Mar 2018 08:09:53 -0600
Message-ID: <CAL_Jsq+AmtN0r0uJjh8shM0pM_1DWCSfSXEQ6S9h6L+1qX7F0A@mail.gmail.com>
Subject: Re: [PATCH] of: get of_root directly in place of of_find_node_by_path("/")
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To: Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
Cc: Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Wed, Mar 7, 2018 at 7:36 PM, Tyrel Datwyler
<tyreld@linux.vnet.ibm.com> wrote:
> On 03/07/2018 02:21 PM, Rob Herring wrote:
>> On Wed, Mar 7, 2018 at 4:14 PM, Tyrel Datwyler
>> <tyreld@linux.vnet.ibm.com> wrote:
>>> On 03/07/2018 12:38 PM, Rob Herring wrote:
>>>> On Fri, Mar 02, 2018 at 08:46:44PM -0500, Tyrel Datwyler wrote:
>>>>> There are a couple places in drivers/of where the root node is found
>>>>> with a of_find_node_by_path("/") call. This call just returns
>>>>> of_node_get(of_root) when the the path "/" is passed as a parameter.
>>>>> So, lets fixup these instances to just do that instead.
>>>>>
>>>>> Signed-off-by: Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
>>>>> ---
>>>>>  drivers/of/base.c     | 2 +-
>>>>>  drivers/of/platform.c | 4 ++--
>>>>>  2 files changed, 3 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/drivers/of/base.c b/drivers/of/base.c
>>>>> index ad28de9..94c1b4d 100644
>>>>> --- a/drivers/of/base.c
>>>>> +++ b/drivers/of/base.c
>>>>> @@ -455,7 +455,7 @@ int of_machine_is_compatible(const char *compat)
>>>>>      struct device_node *root;
>>>>>      int rc =3D 0;
>>>>>
>>>>> -    root =3D of_find_node_by_path("/");
>>>>> +    root =3D of_node_get(of_root);
>>>>
>>>> The former seems more readable to me. I'll wait and see if Frank has a=
ny
>>>> comments on this change.
>>>
>>> Fair enough. I find them equally readable now that we have a well named=
/defined global, namely "of_root",  pointing at the device tree root. My pr=
imary goal was saving a function call, but I wasn't sure if anybody really =
cares enough. A quick check shows ~77 uses of "of_find_node_by_path("/")" i=
n the kernel. Figured I'd start here and see what the consensus was.
>>
>> As far as outside drivers/of/ is concerned, we certainly don't want to
>> expose global variables. But for most uses, you shouldn't need the
>> root node pointer because most iterating or searching functions treat
>> NULL as root.
>
> In the majority of cases I've seen code searching or iterating that wants=
 to start at root just passes NULL. So, agreed. I was more looking at cases=
 where code actually wants the root node for looking up properties of root.=
 Part of my misguidance is likely due to "of_root" being an exported symbol=
.

All of these could be replaced with of_machine_is_compatible():

arch/powerpc/platforms/40x/ppc40x_simple.c:     if
(of_device_compatible_match(of_root, board)) {
arch/powerpc/platforms/512x/mpc512x_generic.c:  if
(!of_device_compatible_match(of_root, board))
arch/powerpc/platforms/52xx/efika.c:    const char *model =3D
of_get_property(of_root, "model", NULL);
arch/powerpc/platforms/52xx/lite5200.c: return
of_device_compatible_match(of_root, board);
arch/powerpc/platforms/52xx/media5200.c:        return
of_device_compatible_match(of_root, board);
arch/powerpc/platforms/52xx/mpc5200_simple.c:   return
of_device_compatible_match(of_root, board);
arch/powerpc/platforms/83xx/mpc830x_rdb.c:      return
of_device_compatible_match(of_root, board);
arch/powerpc/platforms/83xx/mpc831x_rdb.c:      return
of_device_compatible_match(of_root, board);
arch/powerpc/platforms/83xx/mpc837x_rdb.c:      return
of_device_compatible_match(of_root, board);
arch/powerpc/platforms/85xx/corenet_generic.c:  if
(of_device_compatible_match(of_root, boards))
arch/powerpc/platforms/85xx/tqm85xx.c:  return
of_device_compatible_match(of_root, board);


There's lots of open coding to get the model string. Things like this
(in sio_init) could be replaced with either of_machine_is_compatible
(not sure if that would be equivalent) or a helper to get the model:

        root =3D of_find_node_by_path("/");
        if (!root)
                return;

        model =3D of_get_property(root, "model", NULL);
        if (model && !strncmp(model, "IBM,LongTrail", 13)) {


Rob
