From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH v2] arm64: dts: fast models: Remove clcd's
 max-memory-bandwidth
Date: Fri, 26 Jul 2019 10:50:25 +0100
Message-ID: <20190726095025.GB11177@e107155-lin>
References: <20190725171215.71801-1-kevin.brodsky@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190725171215.71801-1-kevin.brodsky@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ruben Ayrapetyan <ruben.ayrapetyan@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org, Sudeep Holla <sudeep.holla@arm.com>, Robin Murphy <robin.murphy@arm.com>, Brian Starkey <brian.starkey@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Jul 25, 2019 at 06:12:14PM +0100, Kevin Brodsky wrote:
> It is unclear why max-memory-bandwidth should be set for CLCD on the
> fast model. Removing that property allows allocating and using 32bpp
> buffers, which may be desirable on certain platforms such as
> Android.
> 
> Reported-by: Ruben Ayrapetyan <ruben.ayrapetyan@arm.com>
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
> 
> Changes in v2:
> - Remove the attribute completely instead of increasing its value. It is
>   optional and there is no clear reason why it should be set at all.
> 
>  arch/arm64/boot/dts/arm/fvp-base-revc.dts        | 8 --------
>  arch/arm64/boot/dts/arm/rtsm_ve-motherboard.dtsi | 2 --

I was about to ask about the above file in v1, and then saw v2.
I will take this for v5.4. Thanks

--
Regards,
Sudeep
