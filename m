From: Robert Richter <robert.richter@caviumnetworks.com>
Subject: Re: [PATCH v2 2/4] arm64, thunder: Add initial dts for Cavium
 Thunder SoC
Date: Thu, 11 Sep 2014 16:51:09 +0200
Message-ID: <20140911145109.GJ10622@rric.localhost>
References: <1409903205-2762-1-git-send-email-rric@kernel.org>
 <1409903205-2762-3-git-send-email-rric@kernel.org>
 <5017180.kZRPNE71Sv@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <5017180.kZRPNE71Sv@wuerfel>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Robert Richter <rric@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Olof Johansson <olof@lixom.net>, Radha Mohan Chintakuntla <rchintakuntla@cavium.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Arnd,

On 05.09.14 13:21:48, Arnd Bergmann wrote:
> On Friday 05 September 2014 09:46:43 Robert Richter wrote:
> > diff --git a/arch/arm64/boot/dts/thunder-88xx.dts b/arch/arm64/boot/dts/thunder-88xx.dts
> > new file mode 100644
> > index 000000000000..4cc1d059d2d9
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/thunder-88xx.dts
> 
> Most people end up having a soc.dtsi file and a board.dsi file including
> the former and adding the machine-specific properties.

thanks for your feedback on the dts file. I already included your
suggestion into the patches and split the files.

-Robert
