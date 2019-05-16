From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH] arm64: dts: sprd: Add clock properties for serial devices
Date: Thu, 16 May 2019 14:43:41 -0700
Message-ID: <20190516214341.2qxtmg4turuuozkn@localhost>
References: <1246f7a9ce912458ea3b889b0c0e392897a664c8.1554879978.git.baolin.wang@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1246f7a9ce912458ea3b889b0c0e392897a664c8.1554879978.git.baolin.wang@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Baolin Wang <baolin.wang@linaro.org>
Cc: arnd@arndb.de, robh+dt@kernel.org, mark.rutland@arm.com, arm@kernel.org, linux-arm-kernel@lists.infradead.org, orsonzhai@gmail.com, zhang.lyra@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Apr 10, 2019 at 03:22:50PM +0800, Baolin Wang wrote:
> We've introduced power management logics for the Spreadtrum serial
> controller by commit 062ec2774c8a ("serial: sprd: Add power management
> for the Spreadtrum serial controller"), thus add related clock properties
> to support this feature.
> 
> Signed-off-by: Baolin Wang <baolin.wang@linaro.org>

Applied to arm/late.


-Olof
