From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Subject: Re: Using device tree overlays in Linux
Date: Tue, 9 Apr 2019 20:54:03 +0000
Message-ID: <85be88b38c79424d84ee2499b5ab81fc@svr-chch-ex1.atlnz.lc>
References: <71fb0ff289e84c55bd92ecd96bc9aa76@svr-chch-ex1.atlnz.lc>
 <61185ee9-4bee-eec3-f0d0-6d6760595845@gmail.com>
 <224942bd629e41eaa23ab327b015134e@svr-chch-ex1.atlnz.lc>
 <b2e0e55e-38a3-3dfb-3453-f57d7e2e99a3@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>, "pantelis.antoniou@konsulko.com" <pantelis.antoniou@konsulko.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Hamish Martin <Hamish.Martin@alliedtelesis.co.nz>
List-Id: devicetree@vger.kernel.org

On 10/04/19 7:19 AM, Frank Rowand wrote:=0A=
> On 4/7/19 6:27 PM, Chris Packham wrote:=0A=
>> Hi Frank,=0A=
>>=0A=
>> On 8/04/19 1:05 PM, Frank Rowand wrote:=0A=
>>> Hi Chris,=0A=
>>>=0A=
>>> On 4/3/19 6:50 PM, Chris Packham wrote:=0A=
>>>> Hi,=0A=
>>>>=0A=
>>>> I'm implementing support for some modular Linux based systems using=0A=
>>>> device tree overlays. The code is working but it seems a little more=
=0A=
>>>> fiddly that than it should be so I'm wondering if I'm doing it right.=
=0A=
>>>=0A=
>>> Let me start by saying that I strongly discourage using device tree=0A=
>>> overlays in the Linux kernel until the support is more baked.  For=0A=
>>> some info on how unbaked overlays are, see:=0A=
>>>=0A=
>>>      https://elinux.org/Frank%27s_Evolving_Overlay_Thoughts=0A=
>>>=0A=
>>> You should consider applying overlays in the Linux kernel to be=0A=
>>> fragile at best.=0A=
>>>=0A=
>>> If you can not figure out how to solve your needs without using=0A=
>>> overlays, then having the boot loader apply the overlay instead=0A=
>>> of the kernel applying the overlay avoids most of the issues.=0A=
>>>=0A=
>>=0A=
>> Consider us beta-testers :).=0A=
> =0A=
> You should read the elinux.org page more carefully.  The support=0A=
> isn't even alpha stage.  It is at the level of proof of concept.=0A=
> =0A=
> I'll update that page to explicitly say the code is proof of=0A=
> concept.=0A=
=0A=
pre-alpha-testers then. We've actually been using the early overlay =0A=
support for a while and it's suited our needs quite well. Aside from the =
=0A=
internal API changes as we move to the latest kernel the current support =
=0A=
also seems to meet our needs.=0A=
=0A=
Both Hamish and I are quite keen to see this move forward so please =0A=
don't hesitate to ask us if there are things we might be able to help =0A=
with. Even if it's just trying something out on our hardware platforms.=0A=
