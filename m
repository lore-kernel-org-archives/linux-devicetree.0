From: Santosh Shilimkar <santosh.shilimkar@ti.com>
Subject: Re: [PATCH v2 4/7] dma: of: introduce of_dma_is_coherent() helper
Date: Fri, 28 Feb 2014 09:17:08 -0500
Message-ID: <53109A64.9030701@ti.com>
References: <1393535872-20915-1-git-send-email-santosh.shilimkar@ti.com>
 <1393535872-20915-5-git-send-email-santosh.shilimkar@ti.com>
 <10040083.PbPEQQPCjl@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <10040083.PbPEQQPCjl@wuerfel>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "magnus.damm@gmail.com" <magnus.damm@gmail.com>, Olof Johansson <olof@lixom.net>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Friday 28 February 2014 04:39 AM, Arnd Bergmann wrote:
> On Thursday 27 February 2014 16:17:49 Santosh Shilimkar wrote:
>> +
>> +/**
>> + * of_dma_is_coherent - Check if device is coherent
>> + * @np:        device node
>> + *
>> + * It returns true if "dma-coherent" property was found
>> + * for this device in DT.
>> + */
>> +bool of_dma_is_coherent(struct device_node *np)
>> +{
>> +       struct device_node *node = np;
>> +
>> +       while (node) {
>> +               if (of_property_read_bool(node, "dma-coherent")) {
>> +                       of_node_put(node);
>> +                       return true;
>> +               }
>> +               node = of_get_next_parent(node);
>> +       }
>> +       return false;
>> +}
>> +EXPORT_SYMBOL_GPL(of_dma_is_coherent);
>>
> 
> This won't work on architectures that are always coherent and
> did not need 'dma-coherent' properties before, such as IBM
> Power servers.
> 
> That said, I think the property makes sense, and we already have
> platforms using it (highbank is the one I'm aware of).
> 
> We probably need ways to override this function in both ways:
> "always coherent" (powerpc, x86), and "never coherent" (keystone
> without LPAE) from platform code, and it would be nice to put
> either option into DT in a global location as well. We may have
> to go through a few iterations of this patch to get the best
> algorithm, but I think the interface is good at least.
> 
Probably we should discuss bit more next week at connect. The
current 'dma-coherent' is a per device property. For arch's
which are always coherent, the per device property doesn't make
sense.

BTW, the current users of this API is only ARM32 bit port
and if this satisfies the ARM platforms, we should get
this in kernel and then address other cases on need
basis.

Regards,
Santosh
