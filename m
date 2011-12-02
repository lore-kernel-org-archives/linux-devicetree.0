From: Jerry Van Baren <gvb.uboot@gmail.com>
Subject: Re: [PATCH 02/14] fdt: Add functions to access phandles,
 arrays and bools
Date: Thu, 01 Dec 2011 22:33:08 -0500
Message-ID: <4ED846F4.5080704@gmail.com>
References: <1322106896-23054-2-git-send-email-sjg@chromium.org>
	<1322106896-23054-3-git-send-email-sjg@chromium.org>
	<4ED3D5DC.10502@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <4ED3D5DC.10502@nvidia.com>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Stephen Warren <swarren@nvidia.com>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>, Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, Tom Warren <TWarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

On 11/28/2011 01:41 PM, Stephen Warren wrote:
> On 11/23/2011 08:54 PM, Simon Glass wrote:
>> Add a function to lookup a property which is a phandle in a node, and
>> another to read a fixed-length integer array from an fdt property.
>> Also add a function to read boolean properties.
>>
>> Signed-off-by: Simon Glass<sjg@chromium.org>
>
> Looking at the U-Boot custodians web page, you need to send the core DT
> changes (well, probably anything DT related) to Jerry Van Baren.

Yeah, I saw the patch go by.  I did not recognize the file it patched 
and looked at the history:

commit b5220bc6ed6e6a197adf4926958dca1df4b420b0
Author: Simon Glass <sjg@chromium.org>
Date:   Mon Oct 24 19:15:32 2011 +0000

     fdt: add decode helper library

     This library provides useful functions to drivers which want to use
     the fdt to control their operation. Functions are provided to:
     :
     :

and the copyright is "Copyright (c) 2011 The Chromium OS Authors."

FDT helper functions have been accumulating in common/fdt_support.c 
rather than a separate file.  Simon, what is the history of 
lib/fdtdec.c?  Is it a shared file from the linux kernel?  If it is 
u-boot specific, it would probably be better to add the functions to 
fdt_support.c.

In the same vein, I also have not looked at the functions provided by 
fdtdec.c to see if there is any overlap with existing fdt_support.c 
functions (a quick look says not).

Best regards,
gvb

[snip]
