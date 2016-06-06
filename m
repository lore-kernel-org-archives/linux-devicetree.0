From: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH 3/5] regulator: rn5t618: add RN5T567 PMIC support
Date: Mon, 06 Jun 2016 10:47:40 -0700
Message-ID: <c6edd422420533d16c076ad5e721e549@agner.ch>
References: <20160605001749.4062-1-stefan@agner.ch>
 <20160605001749.4062-5-stefan@agner.ch>
 <20160606173539.GC7510@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160606173539.GC7510@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: lee.jones@linaro.org, lgirdwood@gmail.com, khilman@baylibre.com, carlo@caione.org, b.galvani@gmail.com, max.oss.09@gmail.com, marcel@ziswiler.com, linux@armlinux.org.uk, galak@codeaurora.org, ijc+devicetree@hellion.org.uk, mark.rutland@arm.com, pawel.moll@arm.com, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 2016-06-06 10:35, Mark Brown wrote:
> On Sat, Jun 04, 2016 at 05:17:47PM -0700, Stefan Agner wrote:
>> Extend the driver to support Ricoh RN5T567. Support the additional
>> DCDC and slightly different voltage range of LDORTC1.
> 
> Acked-by: Mark Brown <broonie@kernel.org>

Thanks Mark.

Do you have an idea how the patchset should be handled with the
dependent dt change in patch 1?
