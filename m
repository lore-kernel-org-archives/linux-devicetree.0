From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [PATCH] ARM: dts: mvebu: Add Armada 38x labels and clean up
 Turris Omnia
Date: Mon, 28 Nov 2016 11:52:26 +0100
Message-ID: <4ad1108a-43c4-46f8-4683-1c4b89996036@suse.de>
References: <1fc18002-0144-8300-1888-09f456860ef0@kleine-koenig.org>
 <1480272700-28888-1-git-send-email-afaerber@suse.de>
 <20161128103738.GT14217@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161128103738.GT14217@n2100.armlinux.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>, devicetree@vger.kernel.org, Tomas Hlavacek <tomas.hlavacek@nic.cz>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Gregory Clement <gregory.clement@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, =?UTF-8?B?QmVkxZlpY2hhIEtvxaFhdHU=?= <bedrich.kosata@nic.cz>, Michal Hrusecki <Michal.Hrusecky@nic.cz>
List-Id: devicetree@vger.kernel.org

Hi Russell,

Am 28.11.2016 um 11:37 schrieb Russell King - ARM Linux:
> On Sun, Nov 27, 2016 at 07:51:39PM +0100, Andreas F=E4rber wrote:
>> To more consistently reference nodes by label, add labels for sata,
>> usb2, sdhci and usb3 nodes.
>>
>> Convert all other 38x boards for consistency. Add labels for nfc and rtc.
> =

> Please don't do this for clearfog - there's changes in the pipeline which
> completely replace armada-388-clearfog.dts because there's a "base" and
> "pro" versions of this hardware now, and making such a huge change will
> effectively mean we have to start over with the DT files.

Would it help to split it back up into a series of add-labels,
use-labels like I had originally? Then you could start using them in
your refactoring as soon as the add-labels patch gets applied. Or are
you completely against this style?

Thanks for pointing this out,

Andreas

-- =

SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Felix Imend=F6rffer, Jane Smithard, Graham Norton
HRB 21284 (AG N=FCrnberg)
