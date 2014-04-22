From: Jonas Gorski <jogo@openwrt.org>
Subject: Re: [PATCH RESEND 4/5] ARM: BCM63XX: add BCM963138DVT Reference
 platform DTS
Date: Tue, 22 Apr 2014 15:49:52 +0200
Message-ID: <CAOiHx=mxDeAE0OMOr4dWN1g3_PbwNoJ-7UJ4x6PjeOWdP_hFdA@mail.gmail.com>
References: <1398130758-19456-1-git-send-email-f.fainelli@gmail.com>
 <1398130758-19456-5-git-send-email-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1398130758-19456-5-git-send-email-f.fainelli@gmail.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, bcm@fixthebug.org, Arnd Bergmann <arnd@arndb.de>, Kevin Cernekee <cernekee@gmail.com>, mporter@linaro.org, aelder@linaro.org, olof@lixom.net, Maxime Bizon <mbizon@freebox.fr>, jpeshkin@broadcom.com, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 22, 2014 at 3:39 AM, Florian Fainelli <f.fainelli@gmail.com> wrote:
> Add a DTS file for the Broadcom BCM963138DVT reference platform board
> which leverages the bcm63138.dtsi SoC DTSi file.
>
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  arch/arm/boot/dts/Makefile        |  3 +++
>  arch/arm/boot/dts/bcm63138dvt.dts | 18 ++++++++++++++++++
>  2 files changed, 21 insertions(+)
>  create mode 100644 arch/arm/boot/dts/bcm63138dvt.dts

Shouldn't the file be called bcm*9*63138dvt.dts, same as the board name?


Regards
Jonas
