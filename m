From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH v4 3/4] drivers: of: add initialization code for dma
 reserved memory
Date: Wed, 7 Aug 2013 08:08:13 -0500
Message-ID: <CAL_JsqLKYn3pnRPVdDYnpHfFudJBo_bHLD10c-QF8yUJkLMNcQ@mail.gmail.com>
References: <1375275119-12787-1-git-send-email-m.szyprowski@samsung.com>
 <1375275119-12787-4-git-send-email-m.szyprowski@samsung.com>
 <CAL_JsqK7FNeqbx2DFHou5xeU08L4Stn+NrHUmFjap_A1pEq9JQ@mail.gmail.com>
 <xa1ttxj2luxi.fsf@mina86.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <xa1ttxj2luxi.fsf@mina86.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Michal Nazarewicz <mina86@mina86.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Sascha Hauer <s.hauer@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Nishanth Peethambaran <nishanth.p@gmail.com>, linaro-mm-sig@lists.linaro.org, Marc <marc.ceeeee@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Olof Johansson <olof@lixom.net>, Laura Abbott <lauraa@codeaurora.org>, Tomasz Figa <t.figa@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 6, 2013 at 10:07 AM, Michal Nazarewicz <mina86@mina86.com> wrote:
> On Tue, Aug 06 2013, Rob Herring wrote:
>>> +static void reserved_mem_release_device_from_dt(struct device *dev)
>>> +{
>>> +       struct reserved_mem *region = get_dma_memory_region(dev);
>>> +       if (!region)
>>> +               return;
>>> +       if (!region->cma)
>>
>> if (region && !region->cma)
>
> !region case is handled two lines above, so no need to check if region
> is not null.

Right. Sorry if I was not clear. Combine the 3 lines into 1 line.

Rob
