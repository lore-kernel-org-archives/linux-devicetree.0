From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v7 3/4] ARM: davinci: dts: make psc0 a reset provider
Date: Mon, 2 Jul 2018 17:27:21 +0530
Message-ID: <b56077f5-c8ef-6c19-7b2e-c82eec23d127@ti.com>
References: <20180621073706.22812-1-brgl@bgdev.pl>
 <20180621073706.22812-4-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180621073706.22812-4-brgl@bgdev.pl>
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
To: Bartosz Golaszewski <brgl@bgdev.pl>, Kevin Hilman <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, David Lechner <david@lechnology.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thursday 21 June 2018 01:07 PM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> The psc driver registers with the reset framework as a provider. Add
> the #reset-cells property to the psc0 node.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Reviewed-by: David Lechner <david@lechnology.com>

Applied to v4.19/dt branch of my tree.

Thanks,
Sekhar
