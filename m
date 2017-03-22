From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 07/15] ARM: dts: spear13xx: fix PCI bus dtc warnings
Date: Wed, 22 Mar 2017 09:41:36 +0530
Message-ID: <20170322041136.GU25659@vireshk-i7>
References: <20170322020313.24338-1-robh@kernel.org>
 <20170322020313.24338-7-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20170322020313.24338-7-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, arm@kernel.org, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, linux-arm-kernel@lists.infradead.org, Viresh Kumar <vireshk@kernel.org>
List-Id: devicetree@vger.kernel.org

On 21-03-17, 21:03, Rob Herring wrote:
> dtc recently added PCI bus checks. Fix these warnings.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> Cc: Viresh Kumar <vireshk@kernel.org>
> Cc: Shiraz Hashim <shiraz.linux.kernel@gmail.com>
> ---
> Sub-arch maintainers, please apply to your trees unless arm-soc wants 
> to take the whole lot.
> 
>  arch/arm/boot/dts/spear1310.dtsi | 3 +++
>  arch/arm/boot/dts/spear1340.dtsi | 1 +
>  2 files changed, 4 insertions(+)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
