From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/4] clk: add DT clock binding support
Date: Mon, 14 May 2012 08:40:01 -0500
Message-ID: <4FB10B31.7080207@gmail.com>
References: <1334003101-17274-1-git-send-email-robherring2@gmail.com>
 <1334003101-17274-4-git-send-email-robherring2@gmail.com>
 <20120501225900.GC17311@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120501225900.GC17311-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Mike Turquette <mturquette-l0cyMroinI0@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 05/01/2012 05:59 PM, Mike Turquette wrote:
> On 20120409-15:25, Rob Herring wrote:
>> From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> snip
>> ---
>>  .../devicetree/bindings/clock/clock-bindings.txt   |  117 ++++++++++++++++
>>  .../devicetree/bindings/clock/fixed-clock.txt      |   22 +++
>>  drivers/clk/clk.c                                  |  140 ++++++++++++++++++++
>>  drivers/clk/clkdev.c                               |   77 +++++++++++
>>  include/linux/clk-provider.h                       |   14 ++
>>  include/linux/clk.h                                |   19 +++
>>  6 files changed, 389 insertions(+), 0 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/clock/clock-bindings.txt
>>  create mode 100644 Documentation/devicetree/bindings/clock/fixed-clock.txt
> 
> Hi Rob,
> 
> Patches 1 & 2 are trivial and certainly aimed at clk-next, so I've taken
> them in.  This patch is a bit more difficult as it touches the common
> clk code, clkdev/clk.h and some DT docs.
> 
> Are you looking for me to take this patch into clk-next?  I'm just
> trying to avoid any more clk dependency issues than we already have...
> 

I think that makes the most sense as it appears I'm dependent on
clk-next now. I'm rebasing my patches on clk-next now.

Rob
