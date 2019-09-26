From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [RFC PATCHv2 1/3] dt-bindings: misc: Add dt bindings for flex
 noc Performance Monitor
Date: Thu, 26 Sep 2019 07:29:59 +0200
Message-ID: <20190926052959.GA1562021@kroah.com>
References: <2de75a74ef4086090c532d3b80b7d6dcd115e45e.1569474867.git.shubhrajyoti.datta@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2de75a74ef4086090c532d3b80b7d6dcd115e45e.1569474867.git.shubhrajyoti.datta@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, arnd@arndb.de, michal.simek@xilinx.com
List-Id: devicetree@vger.kernel.org

On Thu, Sep 26, 2019 at 10:46:24AM +0530, Shubhrajyoti Datta wrote:
> Add dt bindings for flexnoc Performance Monitor.
> The flexnoc counters for read and write response and requests are
> supported.
> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> ---
>  .../devicetree/bindings/misc/xlnx,flexnoc.txt      | 24 ++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/misc/xlnx,flexnoc.txt

<snip>

Why are these "RFC"?

I guess you don't want them merged because you are not thinking that
they are good enough?  What needs to be done on them that you are
sending them out now?

greg k-h
