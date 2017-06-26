From: Hugues FRUCHET <hugues.fruchet@st.com>
Subject: Re: [PATCH v1 5/6] [media] ov9650: add multiple variant support (fwd)
Date: Mon, 26 Jun 2017 09:59:04 +0000
Message-ID: <c58a896c-4955-e051-82b6-395174cdbe7e@st.com>
References: <alpine.DEB.2.20.1706251559180.3109@hadrien>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <alpine.DEB.2.20.1706251559180.3109@hadrien>
Content-Language: en-US
Content-ID: <8DEAE6A33F22974AA2DF8424A82E7F86@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Alexandre TORGUE <alexandre.torgue@st.com>, "H. Nikolaus Schaller" <hns@goldelico.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Rob Herring <robh+dt@kernel.org>, "kbuild-all@01.org" <kbuild-all@01.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Yannick FERTRE <yannick.fertre@st.com>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Ok course, thanks Julia.

On 06/25/2017 10:00 PM, Julia Lawall wrote:
> Braces are probably missing aroud lines 1618-1620.
> 
> julia
> 
> ---------- Forwarded message ----------
> Date: Sun, 25 Jun 2017 23:06:03 +0800
> From: kbuild test robot <fengguang.wu@intel.com>
> To: kbuild@01.org
> Cc: Julia Lawall <julia.lawall@lip6.fr>
> Subject: Re: [PATCH v1 5/6] [media] ov9650: add multiple variant support
> 
> Hi Hugues,
> 
> [auto build test WARNING on linuxtv-media/master]
> [also build test WARNING on v4.12-rc6 next-20170623]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
> 
> url:    https://github.com/0day-ci/linux/commits/Hugues-Fruchet/Add-support-of-OV9655-camera/20170625-201153
> base:   git://linuxtv.org/media_tree.git master
> :::::: branch date: 3 hours ago
> :::::: commit date: 3 hours ago
> 
>>> drivers/media/i2c/ov9650.c:1618:2-44: code aligned with following code on line 1619
> 
> git remote add linux-review https://github.com/0day-ci/linux
> git remote update linux-review
> git checkout a9fe8c23240a7f8df39c6238d98e41f41fedb641
> vim +1618 drivers/media/i2c/ov9650.c
> 
> a9fe8c23 Hugues Fruchet     2017-06-22  1612  	ov965x->set_params = __ov965x_set_params;
> 84a15ded Sylwester Nawrocki 2012-12-26  1613
> a9fe8c23 Hugues Fruchet     2017-06-22  1614  	ov965x->frame_size = &ov965x->framesizes[0];
> a9fe8c23 Hugues Fruchet     2017-06-22  1615  	ov965x_get_default_format(ov965x, &ov965x->format);
> a9fe8c23 Hugues Fruchet     2017-06-22  1616
> a9fe8c23 Hugues Fruchet     2017-06-22  1617  	if (ov965x->initialize_controls)
> a9fe8c23 Hugues Fruchet     2017-06-22 @1618  		ret = ov965x->initialize_controls(ov965x);
> 84a15ded Sylwester Nawrocki 2012-12-26 @1619  		if (ret < 0)
> 84a15ded Sylwester Nawrocki 2012-12-26  1620  			goto err_ctrls;
> 84a15ded Sylwester Nawrocki 2012-12-26  1621
> 84a15ded Sylwester Nawrocki 2012-12-26  1622  	/* Update exposure time min/max to match frame format */
> 
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
> 
