From: Sergey Suloev <ssuloev@orpaltech.com>
Subject: Re: [PATCH 0/3] Fix broken bananapi m2 devicetree/regulators
Date: Sat, 10 Feb 2018 16:56:43 +0300
Message-ID: <160b60e2-6e50-0d63-e6ac-b67e10317e12@orpaltech.com>
References: <20180209175236.21215-1-embed3d@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180209175236.21215-1-embed3d@gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Philipp Rossak <embed3d@gmail.com>, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, maxime.ripard@free-electrons.com, wens@csie.org
Cc: devicetree@vger.kernel.org, linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 02/09/2018 08:52 PM, Philipp Rossak wrote:
> This patchseries fixes the bananapi m1 devicetree, to be able to boot again.
> The first two patches update/improve the devicetree and the last patch adds
> all missing regulators.
>
> Regards,
> Philipp
>
> Philipp Rossak (3):
>    arm: dts: sun6i: a31s: bpi-m2: update mmc supply nodes
>    arm: dts: sun6i: a31s: bpi-m2: improve pmic properties
>    arm: dts: sun6i: a31s: fix: bpi-m2: add missing regulators
>
>   arch/arm/boot/dts/sun6i-a31s-sinovoip-bpi-m2.dts | 70 +++++++++++++++++++++++-
>   1 file changed, 67 insertions(+), 3 deletions(-)
>
patches are not working

Thanks
