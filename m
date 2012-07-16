From: Florian Fainelli <florian@openwrt.org>
Subject: Re: [PATCH 0/8] ARM: support for Moschip MCS814x SoCs
Date: Mon, 16 Jul 2012 10:16:10 +0200
Message-ID: <6935999.5Q12VaaN3A@flexo>
References: <1342363754-30808-1-git-send-email-florian@openwrt.org>
 <201207151959.19620.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <201207151959.19620.arnd@arndb.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: olof@lixom.net, devicetree-discuss@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

Hello Arnd,

On Sunday 15 July 2012 19:59:19 Arnd Bergmann wrote:
> On Sunday 15 July 2012, Florian Fainelli wrote:
> > This patchset adds basic support for Mocship MCS814x, and in particular
> > MCS8140, and allows one booting to user space. Two off-the-shelf boards
> > are support: Tigal/Robotech RBT-832 and Devolo dLAN USB Extender.
> > 
> > Support for other on-board peripherals will obviously be contributed later
> > once the basic SoC support has been accepted.
> 
> Hi Florian,
> 
> This looks quite nice at first sight, but I have to say that your timing
> is rather unfortunate. We're getting rather close to the 3.6 merge window,
> so there is not much time to review the platform thoroughly before that
> and I'd feel more comfortable about putting it into 3.7. I'll let others
> weigh in, too. At least there is no risk of regressions for a new platform
> getting added, so if other people think we should take it for 3.5, I might
> get convinced.

I am not in a hurry getting this merged during the 3.6 merge window, so this 
really is not a big deal for me, I just wanted this out so that people can 
comment on it.

> 
> I'll follow up with more detailed feedback on the individual patches.

Thank you!
--
Florian
