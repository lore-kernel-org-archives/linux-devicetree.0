From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH V7 00/11] misc: xilinx sd-fec drive
Date: Fri, 21 Jun 2019 16:15:53 +0200
Message-ID: <20190621141553.GA16650@kroah.com>
References: <1560274185-264438-1-git-send-email-dragan.cvetic@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1560274185-264438-1-git-send-email-dragan.cvetic@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dragan Cvetic <dragan.cvetic@xilinx.com>
Cc: arnd@arndb.de, michal.simek@xilinx.com, linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Derek Kiernan <derek.kiernan@xilinx.com>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 11, 2019 at 06:29:34PM +0100, Dragan Cvetic wrote:
> This patchset is adding the full Soft Decision Forward Error
> Correction (SD-FEC) driver implementation, driver DT binding and
> driver documentation.
> 
> Forward Error Correction (FEC) codes such as Low Density Parity
> Check (LDPC) and turbo codes provide a means to control errors in
> data transmissions over unreliable or noisy communication
> channels. The SD-FEC Integrated Block is an optimized block for
> soft-decision decoding of these codes. Fixed turbo codes are
> supported directly, whereas custom and standardized LDPC codes
> are supported through the ability to specify the parity check
> matrix through an AXI4-Lite bus or using the optional programmable
> (PL)-based support logic. For the further information see
> https://www.xilinx.com/support/documentation/ip_documentation/
> sd_fec/v1_1/pg256-sdfec-integrated-block.pdf
> 
> This driver is a platform device driver which supports SDFEC16
> (16nm) IP. SD-FEC driver supports LDPC decoding and encoding and
> Turbo code decoding. LDPC codes can be specified on
> a codeword-by-codeword basis, also a custom LDPC code can be used.
> 
> The SD-FEC driver exposes a char device interface and supports
> file operations: open(), close(), poll() and ioctl(). The driver
> allows only one usage of the device, open() limits the number of
> driver instances. The driver also utilize Common Clock Framework
> (CCF).
> 
> The control and monitoring is supported over ioctl system call.
> The features supported by ioctl():
> - enable or disable data pipes to/from device
> - configure the FEC algorithm parameters
> - set the order of data
> - provide a control of a SDFEC bypass option
> - activates/deactivates SD-FEC
> - collect and provide statistical data
> - enable/disable interrupt mode

Is there any userspace tool that talks to this device using these custom
ioctls yet?

Doing a one-off ioctl api is always a risky thing, you are pretty much
just creating brand new system calls for one piece of hardware.

Anyway, I took the first 3 patches here because they looked sane.  and
stopped when I ran into the ioctl problem...

thanks,

greg k-h
