From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH] dt: Move device tree documentation out of powerpc directory
Date: Wed, 26 Jan 2011 12:58:50 -0700
Message-ID: <AANLkTimmHSxP32WsYL1ZXor1GuZQ6W91gcbmKOyQumK_@mail.gmail.com>
References: <1296062434-18027-1-git-send-email-grant.likely@secretlab.ca> <20110126194301.GA13541@zod.rchland.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110126194301.GA13541@zod.rchland.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Josh Boyer <jwboyer@linux.vnet.ibm.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linuxppc-dev@lists.ozlabs.org, benh@kernel.crashing.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 26, 2011 at 12:43 PM, Josh Boyer <jwboyer@linux.vnet.ibm.co=
m> wrote:
> On Wed, Jan 26, 2011 at 10:20:34AM -0700, Grant Likely wrote:
>>The device tree is used by more than just PowerPC. =A0Make the docume=
ntation
>>directory available to all.
>>
>>Signed-off-by: Grant Likely <grant.likely@secretlab.ca>
>>---
>>
>>Assuming nobody has an issue with this, I'll push it out to Linus for
>>2.6.38 since it is only a documentation change.
>>
>>g.
>>
>> .../bindings}/4xx/cpm.txt =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0| =A0 =A00
>> .../bindings}/4xx/emac.txt =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 | =A0 =A00
>> .../bindings}/4xx/ndfc.txt =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 | =A0 =A00
>> .../bindings}/4xx/ppc440spe-adma.txt =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
 =A00
>> .../bindings}/4xx/reboot.txt =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 | =A0 =A00
>
> This should probably be renamed to ...bindings}/powerpc4xx/ in that
> case. =A0Similarly for fsl (even more so since they have ARM parts to=
o).

okay, I'll look at reorganizing.

>
> Also the booting-without-of.txt file is very powerpc specific. =A0So =
I
> would suggest either creating a powerpc/ directory under /bindings or
> something similar.

Actually, it isn't.  Very little of it is powerpc-specific, and after
I looked at it I decided that it still made sense to keep it in this
file and add additional sections for arm, x86, mips and microblaze
entry.

g.
