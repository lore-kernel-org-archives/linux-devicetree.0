From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH v3 0/3] clk: clock driver for the Marvell Armada AP806
Date: Wed, 16 Mar 2016 14:16:45 +0100
Message-ID: <20160316141645.458f6f30@free-electrons.com>
References: <1457096275-7581-1-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1457096275-7581-1-git-send-email-thomas.petazzoni@free-electrons.com>
Sender: linux-clk-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org
Cc: Nadav Haklai <nadavh@marvell.com>, Lior Amsalem <alior@marvell.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Yehuda Yitschak <yehuday@marvell.com>, Neta Zur Hershkovits <neta@marvell.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Michael, Stephen,

On Fri,  4 Mar 2016 13:57:52 +0100, Thomas Petazzoni wrote:
> Michael, Stephen,
> 
> Here is a new version of the clock driver and its DT binding for the
> Marvell Armada AP806. As you will see, there is no longer any
> reference to the DFX Server and changes in the clock tree compared to
> the v2. This is due to the fact that the HW has changed from this
> point of view between the test chips and the final revision, and this
> new version aims at supporting only the final revision.

This third version of the patch series has received the ACK from Rob as
the DT binding maintainer, and from Gregory as the mvebu platform
maintainer.

Do you have any other concern about this series, or can it be applied
soon?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
