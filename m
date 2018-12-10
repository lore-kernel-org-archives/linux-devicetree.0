Return-Path: <SRS0=Xgj3=OT=gmail.com=frowand.list@kernel.org>
Subject: Re: phandles using absolute paths in DT overlays
References: <CAMuHMdUgYFkYrpnpOdrE5ce-pHSUqLPPs=gheitp5sAnu=srEQ@mail.gmail.com>
 <20181207013513.GV768@umbus.fritz.box>
 <CAMuHMdUdPKb6go3U46fJsWdfDrx057SPem-ZDi9wOJhfaeCENQ@mail.gmail.com>
 <20181210054928.GR4261@umbus.fritz.box>
From: Frank Rowand <frowand.list@gmail.com>
Message-ID: <0039cd72-2ad1-529e-67b4-44f9eb318d54@gmail.com>
Date: Mon, 10 Dec 2018 14:10:08 -0800
MIME-Version: 1.0
In-Reply-To: <20181210054928.GR4261@umbus.fritz.box>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: David Gibson <david@gibson.dropbear.id.au>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh+dt@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Devicetree Compiler <devicetree-compiler@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Geert,

On 12/9/18 9:49 PM, David Gibson wrote:
> On Fri, Dec 07, 2018 at 09:19:24AM +0100, Geert Uytterhoeven wrote:
>> Hi David,
>>
>> Thanks for your answer!
>>
>> On Fri, Dec 7, 2018 at 2:44 AM David Gibson <david@gibson.dropbear.id.au> wrote:
>>> On Thu, Dec 06, 2018 at 01:56:45PM +0100, Geert Uytterhoeven wrote:
>>>> Some early revisions of SoCs may have hardware bugs that need to be
>>>> fixed up in DT.  Currently we are handling this by including DTS files
>>>> and fixing up nodes and properties, to create different DTB files for
>>>> different SoC revisons (see arch/arm64/boot/dts/renesas/*es1*).
>>>>
>>>> As an alternative, I'm envisioning the use of DT overlays and the
>>>> fdtoverlay tool, in the hope of simplifying the generation of DTBs for
>>>> the various SoC/board combinations.
>>>>
>>>> Ideally, such DTBs would not contain symbols, to avoid inflating DTB
>>>> size.  Hence if fixup overlays would not contain symbolic references,
>>>> there would be no need for symbols.
>>>>
>>>> For anchors, the "&{/path/to/node@address}" syntax is working fine.
>>>> For phandles, while documented on
>>>> https://elinux.org/Device_Tree_Mysteries, and while working fine for the
>>>> non-overlay case, dtc seems to have issues interpreting the DTB:

< snip >

I have updated elinux.org with the limitation for overlays that you report
and that David explained.

-Frank
