From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v2 2/2] pci: host: Add Broadcom STB PCIE RC controller
Date: Mon, 16 May 2016 18:50:08 -0700
Message-ID: <573A78D0.9090000@gmail.com>
References: <1462475700-1654-1-git-send-email-f.fainelli@gmail.com>
 <1462475700-1654-3-git-send-email-f.fainelli@gmail.com>
 <8520D5D51A55D047800579B094147198258955D9@XAP-PVEXMBX01.xlnx.xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8520D5D51A55D047800579B094147198258955D9@XAP-PVEXMBX01.xlnx.xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bharat Kumar Gogada <bharat.kumar.gogada@xilinx.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "bcm-kernel-feedback-list@broadcom.com" <bcm-kernel-feedback-list@broadcom.com>, "jim2101024@gmail.com" <jim2101024@gmail.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "arnd@arndb.de" <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

On 05/11/2016 07:47 AM, Bharat Kumar Gogada wrote:

[snip]

>> +	/* Get the value for the log2 of the scb sizes. Subtract 15 from
>> +	 * each because the target register field has 0==disabled and 1==6KB.
>> +	 */
>> +	log2_scb_sizes = of_get_property(dn, "brcm,log2-scb-sizes", &rlen);
>> +	if (log2_scb_sizes) {
>> +		for (i = 0; i < rlen / sizeof(u32); i++) {
>> +			pcie->scb_size_vals[i]
>> +				= (int)of_read_number(log2_scb_sizes + i, 1)
>> +					- 15;
>> +			pcie->num_memc++;
>> +		}
>> +	}
> In your device tree documentation this is required property, what if this property 
> is missing ?

If you look at the driver, you will see that it assumes a 1GB SCB window
size if this property is absent.

PS: Do you mind trimming your replies in the future just to quote the
relevant part? Pretty much like I just did, this greatly improves the
ability to jump right to where the comments are. Thanks
-- 
Florian
