From: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH RFC] trafgen: xilinx: add axi traffic generator driver
Date: Mon, 15 Jul 2013 07:54:12 -0700
Message-ID: <20130715145412.GA32349@kroah.com>
References: <1373888388-23297-1-git-send-email-sthokal@xilinx.com>
 <c7f93809-56dd-4780-8e1e-962b8ebc7f9f@CO9EHSMHS001.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <c7f93809-56dd-4780-8e1e-962b8ebc7f9f-QhSrsHip19tZbvUCbuG1mrjjLBE8jN/0@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Srikanth Thokala <srikanth.thokala-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Srikanth Thokala <sthokal-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 15, 2013 at 05:09:48PM +0530, Srikanth Thokala wrote:
> This is the driver for AXI Traffic Generator IP. The AXI
> Traffic Generator IP is a core that stresses the AXI4
> interconnect and other AXI4 peripherals in the system.
> It generates a wide variety of AXI4 transactions based on
> the core programming.
> 
> Architecture of the core is broadly separated into a master
> and slave block, each of which contains the write block and
> read block. Other support functions are provided by the
> control registers and three internal RAMs - Master RAM,
> Command RAM, Parameter RAM. The initialisation sequence
> includes programming Command RAM with commands, data into
> Master RAM (optional Parameter RAM programming) and then
> enable master logic using control register interface.
> This sequence generates traffic to cores connected in the
> h/w design.
> 
> The driver for this IP is designed to be a module with
> sysfs interface.  All the control registers and internal
> RAMs can be accessed through sysfs interface.
> 
> NOTE: All the sysfs functions need to be documented
> as per kernel-doc format.

Please do that so we can properly understand the api you are creating
here.

thanks,

greg k-h
