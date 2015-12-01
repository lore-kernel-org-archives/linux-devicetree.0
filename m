From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3] ARM: dts: enable pinctrl for Broadcom NSP
Date: Tue, 1 Dec 2015 11:00:31 +0100
Message-ID: <CACRpkdZCBbrfHq+DiWcfe6i_2FPUXyMQwbsQu5_zAKYa=fJugg@mail.gmail.com>
References: <1448042309-46445-1-git-send-email-yrdreddy@broadcom.com>
 <5654FBE4.5010802@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5654FBE4.5010802@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Yendapally Reddy Dhananjaya Reddy <yrdreddy@broadcom.com>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@arm.linux.org.uk>, Scott Branden <sbranden@broadcom.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Jon Mason <jonmason@broadcom.com>, Ray Jui <rjui@broadcom.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, Kumar Gala <galak@codeaurora.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 25, 2015 at 1:08 AM, Florian Fainelli <f.fainelli@gmail.com> wrote:
> On 20/11/15 09:58, Yendapally Reddy Dhananjaya Reddy wrote:
>> This enables the pinctrl support for Broadcom NSP SoC
>>
>> Signed-off-by: Yendapally Reddy Dhananjaya Reddy <yrdreddy@broadcom.com>
>
> Looks like a sane pinctrl node here, unless there are objections, I
> would like to go ahead and apply this for v4.5, thanks!

I'm waiting for an indication from the other BCM pinctrl
maintainers to tell whether this SoC is unique enough to deserve
its own driver.

Yours,
Linus Walleij
