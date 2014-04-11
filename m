From: Florian Vaussard <florian.vaussard@epfl.ch>
Subject: Re: [PATCH v2] Documentation: dt: Reduce fragmentation of <..> placeholders
Date: Fri, 11 Apr 2014 11:55:00 +0200
Message-ID: <5347BBF4.2060408@epfl.ch>
References: <CAMuHMdUmcnzafPhWrp4qYBB3UniFbVtqzNNg-7ed_Q6hZKMeDw@mail.gmail.com>	<1394234910-8547-1-git-send-email-florian.vaussard@epfl.ch>	<CAL_Jsq+4SztwyrmMtN31Vof3Tb8U9VVpLs1uON5W=VVOpX=nUQ@mail.gmail.com> <CAL_JsqLiAF916KvHDgRu2df0qbkYAUL51BFq-62z50xfzZOr-g@mail.gmail.com>
Reply-To: florian.vaussard@epfl.ch
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqLiAF916KvHDgRu2df0qbkYAUL51BFq-62z50xfzZOr-g@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, Geert Uytterhoeven <geert@linux-m68k.org>, Joe Perches <joe@perches.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 04/11/2014 02:25 AM, Rob Herring wrote:
> On Sat, Mar 8, 2014 at 3:09 PM, Rob Herring <robherring2@gmail.com> wrote:
>> On Fri, Mar 7, 2014 at 5:28 PM, Florian Vaussard
>> <florian.vaussard@epfl.ch> wrote:
>>> Placeholders <..> are sometimes used in the devicetree documentation
>>> to define family-wide compatible strings (like fsl,<chip>-ipu where
>>> chip can be any Freescale SoC).
>>>
>>> These placeholders are loosly defined. This lead to some
>>> fragmentation. Looking at the current placeholders, we have:
>>>
>>>       3 <board>
>>>      32 <chip>
>>>       1 <chip name>
>>>       1 <mcu-chip>
>>>       1 <processor>
>>>      30 <soc>
>>>       1 <SOC>
>>>       1 <soc-family>
>>>
>>> This patch consolidates this to:
>>>
>>>       3 <board>
>>>      33 <chip>
>>>       1 <mcu-chip>
>>>       1 <processor>
>>>      32 <soc>
>>>
>>
>> I would prefer to consolidate these into just board and chip. If we
>> have any oddballs, they can just document the exact strings.
> 
> Florian, Do you plan to re-spin this? I can take it for 3.15 if it is
> early in the rc's.
> 

Yes sure, I can re-spin this as soon as 3.15-rc1 is out.

Regards,
Florian
