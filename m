From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 0/7] core, cpu and gated clocks for mvebu
Date: Thu, 15 Nov 2012 22:54:25 +0100
Message-ID: <20121115225425.6230f370@skate>
References: <1353014906-31566-1-git-send-email-andrew@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1353014906-31566-1-git-send-email-andrew-g2DYL2Zd6BY@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Dear Andrew Lunn,

On Thu, 15 Nov 2012 22:28:19 +0100, Andrew Lunn wrote:
> This patchset combines code from Gregory Clement, Sebastian
> Hesselbarth and myself to implement core clks, cpu clock and gated
> clocks on Marvel MVEBU SoCs.
> 
> The Armada 370/XP core clock code is a refactored version of the
> already submitted and ACKed code from Gregory. It has been made to fit
> inside a framework developed by Sebastian which can handle all MVEBU
> SoCs. The Armarda 370/XP SoCs have more core clocks than the older SoCs, and
> the framework needs to handle this. Rather than specify the clock
> frequencies in DT, a Sample At Reset register is used, which describes
> each core clock frequency.
> 
> Armarda XP is an SMP processor, with each CPU having its own
> clock. Gregories code for this has been taken as is.
> 
> The Armarda 370/XP clock source has been converted to the common clock
> framework.
> 
> Dove, Kirkword, and probably Armarda 370/XP have the ability to gate
> clocks to various blocks. A clk-gate clock is created for each of the
> gateable clocks on Dove and Kirkwood. Armarda 370/XP clock gates are
> currently unimplemented. Dove and Kirkwood board-dt.c and DT
> descriptions are then modified to make use of these clk gates.

I had a quick look and made a few comments, but overall, it looks
really great. I really hope we can get this in 3.8.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
