From: Daniel Mack <zonque@gmail.com>
Subject: Re: [PATCH 5/9] ARM: dts: provide DMA config to pxamci
Date: Mon, 09 Dec 2013 10:04:32 +0100
Message-ID: <52A587A0.1050503@gmail.com>
References: <1386348542-9584-1-git-send-email-ynvich@gmail.com>
 <1386543229-1542-1-git-send-email-ynvich@gmail.com>
 <1386543229-1542-6-git-send-email-ynvich@gmail.com>
 <201312090233.58592.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <201312090233.58592.arnd@arndb.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>, Sergei Ianovich <ynvich@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Seungwon Jeon <tgih.jun@samsung.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, DOCUMENTATION <linux-doc@vger.kernel.org>, linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Jaehoon Chung <jh80.chung@samsung.com>, Rob Landley <rob@landley.net>, Chris Ball <cjb@laptop.org>, Robert Jarzmik <robert.jarzmik@free.fr>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 12/09/2013 02:33 AM, Arnd Bergmann wrote:
> On Sunday 08 December 2013, Sergei Ianovich wrote:
>> Non-dts implementation supply required DMA channel numbers as
>> IORESOURCE_DMA. However, there is was no way to get them from
>> device tree.
> 
> I just wrote a lengthy reply to this email to explain in what ways
> you got it wrong, but then I saw that Daniel has already done all
> the work in the right way in August, so nevermind that.
> 
> It hasn't made it upstream yet, but see http://list-archives.org/2013/08/07/linux-mtd-lists-infradead-org/patch-00-20-arm-pxa-move-core-and-drivers-to-dmaengine/f/3444199144
> for how it's done. Maybe Daniel can comment on the status of his
> patches.

I recently rebased all my patches on top of 3.13-rc3, and will resend in
couple of days.

The real problem here is that by reworking the DMA related PXA bits, all
drivers have to be changed at once, and a gradual transition seems
impossible. For that, I was asking for help in areas where I don't have
any hardware to test my patches on, but unfortunately, nobody got back
to me yet.

In particular, the pxa camera driver is something Robert (cc) wanted to
have a look at. Robert, any updates on this?


Anyway, I'll have to clean up some details and will resend my patches
very soon.


Thanks,
Daniel
