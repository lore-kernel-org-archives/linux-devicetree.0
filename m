From: John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH 0/8 v2] k3dma patches to add support for hi3660/HiKey960
Date: Fri, 4 Jan 2019 20:28:48 -0800
Message-ID: <CALAqxLUkLExkYUY+JARcp6znngFiRnXO8dYF9qWEZNmBPtdDpw@mail.gmail.com>
References: <1546635388-13795-1-git-send-email-john.stultz@linaro.org>
 <20190105033738.GA2477@Mani-XPS-13-9360>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190105033738.GA2477@Mani-XPS-13-9360>
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
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Guodong Xu <guodong.xu@linaro.org>, Ryan Grachek <ryan@edited.us>, Zhuangluan Su <suzhuangluan@hisilicon.com>, Tanglei Han <hantanglei@huawei.com>, lkml <linux-kernel@vger.kernel.org>, Wei Xu <xuwei5@hisilicon.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, dmaengine@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 4, 2019 at 7:37 PM Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> Hi John,
>
> On Fri, Jan 04, 2019 at 12:56:20PM -0800, John Stultz wrote:
> > This patch series is based on recent work by Tanglei Han, and
> > adds support for hi3660 SoCs as found on the HiKey960 board,
>
> Not sure about the description/subject here! This patchset adds support
> for ASP DMAC found in HI3660 SoCs, Peripheral DMAC is already supported.
>

So yes, it does enable ASP DMAC support, but the full set also enables
the Peripheral DMAC as well in a few ways:
* Avoiding setting the AXI register, which is configured differently on hi3660.
* By adding support for the dma-avail-chan (so we don't try to use
reserved channels)

thanks
-john
