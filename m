From: Roland Stigge <stigge@antcom.de>
Subject: Re: uImage with integrated dtb file
Date: Mon, 26 Mar 2012 18:48:23 +0200
Message-ID: <4F709DD7.2080606@antcom.de>
References: <4F6E5D5B.8050306@antcom.de> <4F7085DA.6030402@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <4F7085DA.6030402@wwwdotorg.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: devicetree-discuss@lists.ozlabs.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 26/03/12 17:06, Stephen Warren wrote:
>>  quiet_cmd_uimage = UIMAGE  $@
>> -      cmd_uimage = $(CONFIG_SHELL) $(MKIMAGE) -A arm -O linux -T kernel \
>> +      cmd_uimage = cat $< arch/arm/boot/*.dtb > $<.tmp ; \
> 
> That won't work well when multiple .dtb files are built.

That's completely correct! Therefore I called it "hack" (maybe
forgetting to prefix it "ugly"), so please don't use it. ;-)

Roland
