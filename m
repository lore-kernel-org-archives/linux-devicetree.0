From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] arm64: dts: amd: Fix SPI bus warnings
Date: Fri, 28 Sep 2018 12:33:06 +0200
Message-ID: <CAK8P3a1QeQ-LW2bcSw7mDhZWN6Bo-G-v1sqDMKucgW2sg-mAXA@mail.gmail.com>
References: <20180913181245.25484-16-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180913181245.25484-16-robh@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: DTML <devicetree@vger.kernel.org>, suravee.suthikulpanit@amd.com, brijeshkumar.singh@amd.com, Linux ARM <linux-arm-kernel@lists.infradead.org>, "Lendacky, Thomas" <thomas.lendacky@amd.com>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 13, 2018 at 8:13 PM Rob Herring <robh@kernel.org> wrote:
>
> dtc has new checks for SPI buses. Fix the warnings in node names.
>
> arch/arm64/boot/dts/amd/amd-overdrive.dtb: Warning (spi_bus_bridge): /smb/ssp@e1030000: node name for SPI buses should be 'spi'
> arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dtb: Warning (spi_bus_bridge): /smb/ssp@e1030000: node name for SPI buses should be 'spi'
> arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dtb: Warning (spi_bus_bridge): /smb/ssp@e1030000: node name for SPI buses should be 'spi'
>
> Cc: Brijesh Singh <brijeshkumar.singh@amd.com>
> Cc: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
> Cc: Tom Lendacky <thomas.lendacky@amd.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Please apply to the sub-arch tree. The dtc changes haven't landed, but
> will for 4.20.

Applied, thanks!

       Arnd
