From: Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: [PATCH 06/13] ARM: dts: lpc32xx: remove inclusion of deprecated
 skeleton.dtsi
Date: Wed, 30 Jan 2019 22:33:29 +0200
Message-ID: <66feef3c-1116-a853-e8ba-317e497c7dea@mleia.com>
References: <20190129192049.11223-1-vz@mleia.com>
 <20190129192049.11223-7-vz@mleia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190129192049.11223-7-vz@mleia.com>
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
To: Sylvain Lemieux <slemieux.tyco@gmail.com>, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 01/29/2019 09:20 PM, Vladimir Zapolskiy wrote:
> Inclusion of skeleton.dtsi into DTS files is deprecated since
> commit 9c0da3cc61f1233c ("ARM: dts: explicitly mark skeleton.dtsi
> as deprecated").
> 

This change will be dropped to avoid a conflict with a functionally
equal applied change from Rob.

--
Best wishes,
Vladimir
