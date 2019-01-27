From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 0/5] Add initial Bitmain BM1880 SoC/Board support
Date: Sun, 27 Jan 2019 10:24:09 +0100
Message-ID: <CAK8P3a3Y_w5_ZavpyUh0VKrS8FeUPTJKkchtGGLc1qe3nG2mfA@mail.gmail.com>
References: <20190126041041.13173-1-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190126041041.13173-1-manivannan.sadhasivam@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, darren.tsao@bitmain.com, Rob Herring <robh+dt@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, haitao.suo@bitmain.com
List-Id: devicetree@vger.kernel.org

On Sat, Jan 26, 2019 at 5:11 AM Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> Hello,
>
> This patchset adds initial support for Bitmain BM1880 SoC and Sophon
> Edge board. BM1880 SoC consists of a Dual Core ARM Cortex A53 Application
> processor subsystem, a single core RISC-V subsystem and a Tensor
> Processor subsystem. This patchset adds support for only ARM Cortex
> A53 Application processor subsystem with UART, which enables the board to
> boot into initramfs with 2 CPUs.

Nice work! All patches in this series

Acked-by: Arnd Bergmann <arnd@arndb.de>
