From: Will Deacon <will.deacon@arm.com>
Subject: Re: CoreSight framework and drivers
Date: Wed, 19 Dec 2012 11:23:14 +0000
Message-ID: <20121219112314.GA26329@mudshark.cambridge.arm.com>
References: <1355858365-11849-1-git-send-email-pratikp@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1355858365-11849-1-git-send-email-pratikp@codeaurora.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "pratikp@codeaurora.org" <pratikp@codeaurora.org>
Cc: "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "magnus.p.persson@stericsson.com" <magnus.p.persson@stericsson.com>, "david.rusling@linaro.org" <david.rusling@linaro.org>, "arve@android.com" <arve@android.com>, "dsaxena@linaro.org" <dsaxena@linaro.org>, "john.stultz@linaro.org" <john.stultz@linaro.org>, "jon-hunter@ti.com" <jon-hunter@ti.com>, "d-deao@ti.com" <d-deao@ti.com>, "christian.bejram@stericsson.com" <christian.bejram@stericsson.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Pratik,

On Tue, Dec 18, 2012 at 07:19:17PM +0000, pratikp@codeaurora.org wrote:
> This RFC is aimed at introducing CoreSight framework as well as
> individual CoreSight trace component drivers adhering to ARM
> CoreSight specification. Some prior discussion on this can be
> referred at [1].
> 
> There are 3 kinds of CoreSight trace components:
> 
> * Sources: Responsible for producing trace data to provide
>   visibility for the associated entity.
> 
> * Links: Transport components that carry trace data.
> 
> * Sinks: Collectors for storing trace data or acting as conduits
>   for off-chip trace data collection.
> 
> These components can be connected in various topologies to suite
> a particular SoCs tracing needs.
> 
> Framework is responsible for gathering and using the information
> about the registered CoreSight components and their connections
> to allow it to dynamically deduce the sequence of components
> representing a connection from a CoreSight source to the
> currently selected CoreSight sink. This helps the framework to
> program the correct set of components to satisfy user request.

>From a million miles up, this looks like a sensible sort of design but I
really think you need to talk to Jon Hunter (he's at least on CC) about
this, especially where bindings are concerned. If we can get something that
you both agree on, then we can include the CTI with the other coresight
components and do a more in-depth review at that point.

Finally, how do you plan on exposing this data to the user? I think the only
sane way is to have per-device file descriptors which act as pipes to the raw
data but this means we need some readily available, open-source tooling (or
at least public specifications of the trace formats).

Will
