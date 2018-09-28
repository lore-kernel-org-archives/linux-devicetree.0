From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] ARM: dts: lpc32xx: Fix SPI controller node names
Date: Fri, 28 Sep 2018 12:34:07 +0200
Message-ID: <CAK8P3a2i2mpOLSK+nk8+gjeSNuzyH4Q8YG_MbW5jSS_ydBh5Gg@mail.gmail.com>
References: <20180913181245.25484-9-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180913181245.25484-9-robh@kernel.org>
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
Cc: DTML <devicetree@vger.kernel.org>, Sylvain Lemieux <slemieux.tyco@gmail.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Vladimir Zapolskiy <vz@mleia.com>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 13, 2018 at 8:12 PM Rob Herring <robh@kernel.org> wrote:
>
> SPI controller nodes should be named 'spi' rather than 'ssp'. Fixing the
> name enables dtc SPI bus checks.
>
> Cc: Vladimir Zapolskiy <vz@mleia.com>
> Cc: Sylvain Lemieux <slemieux.tyco@gmail.com>
> Signed-off-by: Rob Herring <robh@kernel.org>

Applied, thanks!

      Arnd
