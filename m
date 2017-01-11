From: Christian Lamparter <chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH v2 2/4] usb: dwc2: Add binding for AHB burst
Date: Wed, 11 Jan 2017 19:22:34 +0100
Message-ID: <2481217.sGcrUo83EX@debian64>
References: <cover.1479339900.git.johnyoun@synopsys.com> <1822229.eVKB2DLXUI@debian64> <f2b75acc-4773-e420-53ff-a77d0c9bce31@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <f2b75acc-4773-e420-53ff-a77d0c9bce31-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tuesday, January 10, 2017 3:23:24 PM CET John Youn wrote:
> On 1/10/2017 3:03 PM, Christian Lamparter wrote:
> > On Tuesday, January 10, 2017 1:46:56 PM CET John Youn wrote:
> >> On 12/19/2016 6:49 AM, Christian Lamparter wrote:
> >>> (Lot's of old stuff, that doesn't matter anymore)
> > 
> > Hello John,
> >  
> >> This should be fixed against the latest dwc2 param rework series [1]
> >> which i hope to get queued for 4.11. If you can give it a test, that
> >> would be great.
> > 
> > oh Ok. I see you added it to
> > "[PATCH 16/21] usb: dwc2: Remove platform static params" [0].
> > Yes, I think this should work nicely. Thank you very much for
> > your time, even though it's just for like "one old board" :-).
> 
> No problem. Sorry for the delay getting the param stuff sorted.
> 
> > 
> > Do you have a public git tree with your patches that I can
> > clone/checkout?  If not, I'll take some time on the weekend
> > for this and write back on monday. But yeah, this should 
> > work.
> Yes check here on branch 'next'
> 
> https://github.com/synopsys-usb/linux.git
Ok thanks. I cloned it and built a new kernel for the thing. 

>From the (attached) bootlog:
GAHBCFG   @0xD1210008 : 0x0000002E
0x2E = Bit 5 | (Bit 3 | Bit 2 | Bit 1)
     = GAHBCFG_DMA_EN |
       (GAHBCFG_HBSTLEN_INCR16 << GAHBCFG_HBSTLEN_SHIFT)

I've attached an old 1GiB USB-Stick to the dwc2 managed port
and it does work as expected. The same goes for a usb-3.0 HDD
and a USB 2.0 11n WLAN stick. (All while the DWC SATA is
copying data).

Tested-by: Christian Lamparter <chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>

Again, thank you for your work!

Regards,
Christian
---
These are the kernel messages.

dwc2 4bff80000.usbotg: mapped PA bff80000 to VA d1210000
dwc2 4bff80000.usbotg: registering common handler for irq35
dwc2 4bff80000.usbotg: Forcing mode to host
dwc2 4bff80000.usbotg: Core Release: 2.90a (snpsid=4f54290a)
dwc2 4bff80000.usbotg: Forcing mode to host
dwc2 4bff80000.usbotg: DWC OTG HCD INIT
dwc2 4bff80000.usbotg: hcfg=00000200
dwc2 4bff80000.usbotg: dwc2_core_init(ca890810)
dwc2 4bff80000.usbotg: HS UTMI+ PHY selected
dwc2 4bff80000.usbotg: Internal DMA Mode
dwc2 4bff80000.usbotg: host_dma:1 dma_desc_enable:0
dwc2 4bff80000.usbotg: Using Buffer DMA mode
dwc2 4bff80000.usbotg: Host Mode
dwc2 4bff80000.usbotg: DWC OTG Controller
dwc2 4bff80000.usbotg: new USB bus registered, assigned bus number 1
dwc2 4bff80000.usbotg: irq 35, io mem 0x00000000
dwc2 4bff80000.usbotg: DWC OTG HCD START
dwc2 4bff80000.usbotg: dwc2_core_host_init(ca890810)
dwc2 4bff80000.usbotg: Initializing HCFG.FSLSPClkSel to 00000000
dwc2 4bff80000.usbotg: initial grxfsiz=00000213
dwc2 4bff80000.usbotg: new grxfsiz=00000213
dwc2 4bff80000.usbotg: initial gnptxfsiz=01000213
dwc2 4bff80000.usbotg: new gnptxfsiz=01000213
dwc2 4bff80000.usbotg: initial hptxfsiz=01000313
dwc2 4bff80000.usbotg: new hptxfsiz=01000313
dwc2 4bff80000.usbotg: dwc2_core_host_init: Halt channel 0
dwc2 4bff80000.usbotg: dwc2_core_host_init: Halt channel 1
dwc2 4bff80000.usbotg: dwc2_core_host_init: Halt channel 2
dwc2 4bff80000.usbotg: dwc2_core_host_init: Halt channel 3
dwc2 4bff80000.usbotg: Init: Port Power? op_state=9
dwc2 4bff80000.usbotg: Init: Power Port (0)
dwc2 4bff80000.usbotg: dwc2_enable_host_interrupts()
dwc2 4bff80000.usbotg: DWC OTG HCD Has Root Hub
dwc2 4bff80000.usbotg: DWC OTG HCD EP RESET: bEndpointAddress=0x81
hub 1-0:1.0: USB hub found
dwc2 4bff80000.usbotg: GetHubDescriptor
hub 1-0:1.0: 1 port detected
dwc2 4bff80000.usbotg: GetHubStatus
dwc2 4bff80000.usbotg: SetPortFeature
dwc2 4bff80000.usbotg: 
dwc2 4bff80000.usbotg: ************************************************************
dwc2 4bff80000.usbotg: HCD State:
dwc2 4bff80000.usbotg:   Num channels: 4
dwc2 4bff80000.usbotg:   Channel 0:
dwc2 4bff80000.usbotg:     dev_addr: 0, ep_num: 0, ep_is_in: 0
dwc2 4bff80000.usbotg:     speed: 0
dwc2 4bff80000.usbotg:     ep_type: 0
dwc2 4bff80000.usbotg:     max_packet: 0
dwc2 4bff80000.usbotg:     data_pid_start: 0
dwc2 4bff80000.usbotg:     multi_count: 0
dwc2 4bff80000.usbotg:     xfer_started: 0
dwc2 4bff80000.usbotg:     xfer_buf:   (null)
dwc2 4bff80000.usbotg:     xfer_dma: 00000000
dwc2 4bff80000.usbotg:     xfer_len: 0
dwc2 4bff80000.usbotg:     xfer_count: 0
dwc2 4bff80000.usbotg:     halt_on_queue: 0
dwc2 4bff80000.usbotg:     halt_pending: 0
dwc2 4bff80000.usbotg:     halt_status: 0
dwc2 4bff80000.usbotg:     do_split: 0
dwc2 4bff80000.usbotg:     complete_split: 0
dwc2 4bff80000.usbotg:     hub_addr: 0
dwc2 4bff80000.usbotg:     hub_port: 0
dwc2 4bff80000.usbotg:     xact_pos: 0
dwc2 4bff80000.usbotg:     requests: 0
dwc2 4bff80000.usbotg:     qh:   (null)
dwc2 4bff80000.usbotg:   Channel 1:
dwc2 4bff80000.usbotg:     dev_addr: 0, ep_num: 0, ep_is_in: 0
dwc2 4bff80000.usbotg:     speed: 0
dwc2 4bff80000.usbotg:     ep_type: 0
dwc2 4bff80000.usbotg:     max_packet: 0
dwc2 4bff80000.usbotg:     data_pid_start: 0
dwc2 4bff80000.usbotg:     multi_count: 0
dwc2 4bff80000.usbotg:     xfer_started: 0
dwc2 4bff80000.usbotg:     xfer_buf:   (null)
dwc2 4bff80000.usbotg:     xfer_dma: 00000000
dwc2 4bff80000.usbotg:     xfer_len: 0
dwc2 4bff80000.usbotg:     xfer_count: 0
dwc2 4bff80000.usbotg:     halt_on_queue: 0
dwc2 4bff80000.usbotg:     halt_pending: 0
dwc2 4bff80000.usbotg:     halt_status: 0
dwc2 4bff80000.usbotg:     do_split: 0
dwc2 4bff80000.usbotg:     complete_split: 0
dwc2 4bff80000.usbotg:     hub_addr: 0
dwc2 4bff80000.usbotg:     hub_port: 0
dwc2 4bff80000.usbotg:     xact_pos: 0
dwc2 4bff80000.usbotg:     requests: 0
dwc2 4bff80000.usbotg:     qh:   (null)
dwc2 4bff80000.usbotg:   Channel 2:
dwc2 4bff80000.usbotg:     dev_addr: 0, ep_num: 0, ep_is_in: 0
dwc2 4bff80000.usbotg:     speed: 0
dwc2 4bff80000.usbotg:     ep_type: 0
dwc2 4bff80000.usbotg:     max_packet: 0
dwc2 4bff80000.usbotg:     data_pid_start: 0
dwc2 4bff80000.usbotg:     multi_count: 0
dwc2 4bff80000.usbotg:     xfer_started: 0
dwc2 4bff80000.usbotg:     xfer_buf:   (null)
dwc2 4bff80000.usbotg:     xfer_dma: 00000000
dwc2 4bff80000.usbotg:     xfer_len: 0
dwc2 4bff80000.usbotg:     xfer_count: 0
dwc2 4bff80000.usbotg:     halt_on_queue: 0
dwc2 4bff80000.usbotg:     halt_pending: 0
dwc2 4bff80000.usbotg:     halt_status: 0
dwc2 4bff80000.usbotg:     do_split: 0
dwc2 4bff80000.usbotg:     complete_split: 0
dwc2 4bff80000.usbotg:     hub_addr: 0
dwc2 4bff80000.usbotg:     hub_port: 0
dwc2 4bff80000.usbotg:     xact_pos: 0
dwc2 4bff80000.usbotg:     requests: 0
dwc2 4bff80000.usbotg:     qh:   (null)
dwc2 4bff80000.usbotg:   Channel 3:
dwc2 4bff80000.usbotg:     dev_addr: 0, ep_num: 0, ep_is_in: 0
dwc2 4bff80000.usbotg:     speed: 0
dwc2 4bff80000.usbotg:     ep_type: 0
dwc2 4bff80000.usbotg:     max_packet: 0
dwc2 4bff80000.usbotg:     data_pid_start: 0
dwc2 4bff80000.usbotg:     multi_count: 0
dwc2 4bff80000.usbotg:     xfer_started: 0
dwc2 4bff80000.usbotg:     xfer_buf:   (null)
dwc2 4bff80000.usbotg:     xfer_dma: 00000000
dwc2 4bff80000.usbotg:     xfer_len: 0
dwc2 4bff80000.usbotg:     xfer_count: 0
dwc2 4bff80000.usbotg:     halt_on_queue: 0
dwc2 4bff80000.usbotg:     halt_pending: 0
dwc2 4bff80000.usbotg:     halt_status: 0
dwc2 4bff80000.usbotg:     do_split: 0
dwc2 4bff80000.usbotg:     complete_split: 0
dwc2 4bff80000.usbotg:     hub_addr: 0
dwc2 4bff80000.usbotg:     hub_port: 0
dwc2 4bff80000.usbotg:     xact_pos: 0
dwc2 4bff80000.usbotg:     requests: 0
dwc2 4bff80000.usbotg:     qh:   (null)
dwc2 4bff80000.usbotg:   non_periodic_channels: 0
dwc2 4bff80000.usbotg:   periodic_channels: 0
dwc2 4bff80000.usbotg:   periodic_usecs: 0
dwc2 4bff80000.usbotg:   NP Tx Req Queue Space Avail: 8
dwc2 4bff80000.usbotg:   NP Tx FIFO Space Avail: 256
dwc2 4bff80000.usbotg:   P Tx Req Queue Space Avail: 8
dwc2 4bff80000.usbotg:   P Tx FIFO Space Avail: 256
dwc2 4bff80000.usbotg: Core Global Registers
dwc2 4bff80000.usbotg: GOTGCTL   @0xD1210000 : 0x001E0001
dwc2 4bff80000.usbotg: GOTGINT   @0xD1210004 : 0x00080000
dwc2 4bff80000.usbotg: GAHBCFG   @0xD1210008 : 0x0000002E
dwc2 4bff80000.usbotg: GUSBCFG   @0xD121000C : 0x20001708
dwc2 4bff80000.usbotg: GRSTCTL   @0xD1210010 : 0x80000000
dwc2 4bff80000.usbotg: GINTSTS   @0xD1210014 : 0x05000025
dwc2 4bff80000.usbotg: GINTMSK   @0xD1210018 : 0xF3000806
dwc2 4bff80000.usbotg: GRXSTSR   @0xD121001C : 0x025B34D8
dwc2 4bff80000.usbotg: GRXFSIZ   @0xD1210024 : 0x00000213
dwc2 4bff80000.usbotg: GNPTXFSIZ         @0xD1210028 : 0x01000213
dwc2 4bff80000.usbotg: GNPTXSTS  @0xD121002C : 0x00080100
dwc2 4bff80000.usbotg: GI2CCTL   @0xD1210030 : 0x00000000
dwc2 4bff80000.usbotg: GPVNDCTL  @0xD1210034 : 0x00000000
dwc2 4bff80000.usbotg: GGPIO     @0xD1210038 : 0x00000000
dwc2 4bff80000.usbotg: GUID      @0xD121003C : 0x00000000
dwc2 4bff80000.usbotg: GSNPSID   @0xD1210040 : 0x4F54290A
dwc2 4bff80000.usbotg: GHWCFG1   @0xD1210044 : 0x00000000
dwc2 4bff80000.usbotg: GHWCFG2   @0xD1210048 : 0x228CC850
dwc2 4bff80000.usbotg: GHWCFG3   @0xD121004C : 0x07FA0CE8
dwc2 4bff80000.usbotg: GHWCFG4   @0xD1210050 : 0x09F04011
dwc2 4bff80000.usbotg: GLPMCFG   @0xD1210054 : 0x00000000
dwc2 4bff80000.usbotg: GPWRDN    @0xD1210058 : 0x00000000
dwc2 4bff80000.usbotg: GDFIFOCFG         @0xD121005C : 0x00000000
dwc2 4bff80000.usbotg: HPTXFSIZ  @0xD1210100 : 0x01000313
dwc2 4bff80000.usbotg: PCGCTL    @0xD1210E00 : 0x00000000
dwc2 4bff80000.usbotg: Host Global Registers
dwc2 4bff80000.usbotg: HCFG      @0xD1210400 : 0x00000200
dwc2 4bff80000.usbotg: HFIR      @0xD1210404 : 0x0000EA60
dwc2 4bff80000.usbotg: HFNUM     @0xD1210408 : 0xEA603FFF
dwc2 4bff80000.usbotg: HPTXSTS   @0xD1210410 : 0x00080100
dwc2 4bff80000.usbotg: HAINT     @0xD1210414 : 0x00000000
dwc2 4bff80000.usbotg: HAINTMSK  @0xD1210418 : 0x00000000
dwc2 4bff80000.usbotg: HPRT0     @0xD1210440 : 0x00021403
dwc2 4bff80000.usbotg: Host Channel 0 Specific Registers
dwc2 4bff80000.usbotg: HCCHAR    @0xD1210500 : 0x00000000
dwc2 4bff80000.usbotg: HCSPLT    @0xD1210504 : 0x00000000
dwc2 4bff80000.usbotg: HCINT     @0xD1210508 : 0x00000002
dwc2 4bff80000.usbotg: HCINTMSK  @0xD121050C : 0x00000000
dwc2 4bff80000.usbotg: HCTSIZ    @0xD1210510 : 0x00000000
dwc2 4bff80000.usbotg: HCDMA     @0xD1210514 : 0x8D289912
dwc2 4bff80000.usbotg: Host Channel 1 Specific Registers
dwc2 4bff80000.usbotg: HCCHAR    @0xD1210520 : 0x00000000
dwc2 4bff80000.usbotg: HCSPLT    @0xD1210524 : 0x00000000
dwc2 4bff80000.usbotg: HCINT     @0xD1210528 : 0x00000002
dwc2 4bff80000.usbotg: HCINTMSK  @0xD121052C : 0x00000000
dwc2 4bff80000.usbotg: HCTSIZ    @0xD1210530 : 0x00000000
dwc2 4bff80000.usbotg: HCDMA     @0xD1210534 : 0xBBC5AD7A
dwc2 4bff80000.usbotg: Host Channel 2 Specific Registers
dwc2 4bff80000.usbotg: HCCHAR    @0xD1210540 : 0x00000000
dwc2 4bff80000.usbotg: HCSPLT    @0xD1210544 : 0x00000000
dwc2 4bff80000.usbotg: HCINT     @0xD1210548 : 0x00000002
dwc2 4bff80000.usbotg: HCINTMSK  @0xD121054C : 0x00000000
dwc2 4bff80000.usbotg: HCTSIZ    @0xD1210550 : 0x00000000
dwc2 4bff80000.usbotg: HCDMA     @0xD1210554 : 0xC7D821B3
dwc2 4bff80000.usbotg: Host Channel 3 Specific Registers
dwc2 4bff80000.usbotg: HCCHAR    @0xD1210560 : 0x00000000
dwc2 4bff80000.usbotg: HCSPLT    @0xD1210564 : 0x00000000
dwc2 4bff80000.usbotg: HCINT     @0xD1210568 : 0x00000002
dwc2 4bff80000.usbotg: HCINTMSK  @0xD121056C : 0x00000000
dwc2 4bff80000.usbotg: HCTSIZ    @0xD1210570 : 0x00000000
dwc2 4bff80000.usbotg: HCDMA     @0xD1210574 : 0x7DEDDB55
dwc2 4bff80000.usbotg: ************************************************************
dwc2 4bff80000.usbotg: 
dwc2 4bff80000.usbotg: gintsts=05000025  gintmsk=f3000806
dwc2 4bff80000.usbotg: ++OTG Interrupt gotgint=80000 [a_host]
dwc2 4bff80000.usbotg:  ++OTG Interrupt: Debounce Done++
dwc2 4bff80000.usbotg: ClearPortFeature USB_PORT_FEAT_C_CONNECTION
root@lede:/tmp# dwc2 4bff80000.usbotg: SetPortFeature
dwc2 4bff80000.usbotg: SetPortFeature - USB_PORT_FEAT_RESET
dwc2 4bff80000.usbotg: In host mode, hprt0=00021501
dwc2 4bff80000.usbotg: gintsts=05000021  gintmsk=f3000806
dwc2 4bff80000.usbotg: ClearPortFeature USB_PORT_FEAT_C_RESET
usb 1-1: new high-speed USB device number 2 using dwc2
dwc2 4bff80000.usbotg: SetPortFeature
dwc2 4bff80000.usbotg: SetPortFeature - USB_PORT_FEAT_RESET
dwc2 4bff80000.usbotg: In host mode, hprt0=00001101
dwc2 4bff80000.usbotg: gintsts=05000029  gintmsk=f3000806
dwc2 4bff80000.usbotg: gintsts=05000029  gintmsk=f3000806
dwc2 4bff80000.usbotg: ClearPortFeature USB_PORT_FEAT_C_RESET
dwc2 4bff80000.usbotg: DWC OTG HCD EP DISABLE: bEndpointAddress=0x00, ep->hcpriv=ca80e6c0
dwc2 4bff80000.usbotg: DWC OTG HCD EP DISABLE: bEndpointAddress=0x00, ep->hcpriv=  (null)
dwc2 4bff80000.usbotg: DWC OTG HCD EP RESET: bEndpointAddress=0x00
dwc2 4bff80000.usbotg: DWC OTG HCD HUB STATUS DATA: Root port status changed
dwc2 4bff80000.usbotg:   port_connect_status_change: 0
dwc2 4bff80000.usbotg:   port_reset_change: 0
dwc2 4bff80000.usbotg:   port_enable_change: 1
dwc2 4bff80000.usbotg:   port_suspend_change: 0
dwc2 4bff80000.usbotg:   port_over_current_change: 0
dwc2 4bff80000.usbotg: DWC OTG HCD EP RESET: bEndpointAddress=0x81
dwc2 4bff80000.usbotg: DWC OTG HCD EP RESET: bEndpointAddress=0x02
usb-storage 1-1:1.0: USB Mass Storage device detected
scsi host2: usb-storage 1-1:1.0
dwc2 4bff80000.usbotg: ClearPortFeature USB_PORT_FEAT_C_ENABLE
scsi 2:0:0:0: Direct-Access              FlashPen Fancy   1100 PQ: 0 ANSI: 0 CCS
sd 2:0:0:0: [sda] 1957888 512-byte logical blocks: (1.00 GB/956 MiB)
sd 2:0:0:0: [sda] Write Protect is off
sd 2:0:0:0: [sda] Mode Sense: 43 00 00 00
sd 2:0:0:0: [sda] No Caching mode page found
sd 2:0:0:0: [sda] Assuming drive cache: write through
 sda: sda1
sd 2:0:0:0: [sda] Attached SCSI removable disk
random: crng init done


--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
