From: Ian Campbell <Ian.Campbell@citrix.com>
Subject: Re: [PROPOSAL] ARM/FDT: passing multiple binaries to a kernel
Date: Wed, 4 Sep 2013 09:55:55 +0100
Message-ID: <1378284955.17510.64.camel@kazak.uk.xensource.com>
References: <52260608.2030202@linaro.org>
 <CAL_JsqK9PjpScRO8561PhcyKkxhuL4pgMTCh2-UG_ubybJTcCw@mail.gmail.com>
 <5226F2B3.10606@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5226F2B3.10606@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andre Przywara <andre.przywara@linaro.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, boot-architecture@lists.linaro.org, Julien Grall <julien.grall@linaro.org>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2013-09-04 at 10:43 +0200, Andre Przywara wrote:

> I am about to write up a more elaborate technical rationale describing 
> the problems with multiboot on ARM:
> 
> https://wiki.linaro.org/AndrePrzywara/Multiboot

Doesn't seem to exist? A search for "mulitboot" doesn't seem to throw up
the one you meant either.


> > So, is having a more generic solution really needed?
> 
> Not necessarily needed, but useful, I think. As described above I don't 
> see any technical obstacles of doing it in a more generic way, so we 
> could as well go ahead with this. On x86 from time to time the need for 
> additional binaries pops up (early microcode loading, for instance), so 
> why not be be prepared.

I agree. There have also been occasions where people doing
disaggregation have wanted to start multiple initial domains, requiring
additional modules at load time. I don't think being generic and
extensible is costing too much here.

Ian.
