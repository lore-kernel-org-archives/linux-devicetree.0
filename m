From: Dinh Nguyen <dinguyen@opensource.altera.com>
Subject: Re: [PATCHv5 8/8] ARM: dts: Add Arria10 Ethernet EDAC devicetree
 entry
Date: Mon, 27 Jun 2016 10:31:29 -0500
Message-ID: <577146D1.40106@opensource.altera.com>
References: <1466603939-7526-1-git-send-email-tthayer@opensource.altera.com>
 <1466603939-7526-9-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1466603939-7526-9-git-send-email-tthayer@opensource.altera.com>
Sender: linux-doc-owner@vger.kernel.org
To: tthayer@opensource.altera.com, bp@alien8.de, dougthompson@xmission.com, m.chehab@samsung.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, grant.likely@linaro.org
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tthayer.linux@gmail.com
List-Id: devicetree@vger.kernel.org

Hi Boris,

On 06/22/2016 08:58 AM, tthayer@opensource.altera.com wrote:
> From: Thor Thayer <tthayer@opensource.altera.com>
> 
> Add the device tree entries needed to support the Altera Ethernet
> FIFO buffer EDAC on the Arria10 chip.
> 
> Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
> ---
> v2  No change
> v3  Add interrupts for SBERR and DBERR.
> v4  No change
> v5  Change "parent" phandle to "altr,ecc-parent"
> ---
>  arch/arm/boot/dts/socfpga_arria10.dtsi |   16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 

I've applied this patch and will take through the arm-soc tree.

Thanks,
Dinh

