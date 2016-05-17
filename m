From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v2 1/2] Documentation: DT: bindings: Add Broadcom STB PCIe
 bindings
Date: Mon, 16 May 2016 18:52:31 -0700
Message-ID: <573A795F.2040209@gmail.com>
References: <1462475700-1654-1-git-send-email-f.fainelli@gmail.com>
 <1462475700-1654-2-git-send-email-f.fainelli@gmail.com>
 <8520D5D51A55D047800579B094147198258955CE@XAP-PVEXMBX01.xlnx.xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8520D5D51A55D047800579B094147198258955CE@XAP-PVEXMBX01.xlnx.xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bharat Kumar Gogada <bharat.kumar.gogada@xilinx.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "bcm-kernel-feedback-list@broadcom.com" <bcm-kernel-feedback-list@broadcom.com>, "jim2101024@gmail.com" <jim2101024@gmail.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "arnd@arndb.de" <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

On 05/11/2016 07:45 AM, Bharat Kumar Gogada wrote:
>> +- brcm,log2-scb-sizes: log2 size of the SCB window that is mapped to
>> +PCIe space
>> +  there must be exactly one value per memory controller present in the
>> +system
>> +  (ranges from 1 to 3)
> 
> Can you please give more insight on what does this property do ?

There is another part of the thread that should tell you a bit more what
this is about, here is where it starts:

http://www.spinics.net/lists/linux-pci/msg50973.html

And this is where we discuss what we should be doing about it:

http://www.spinics.net/lists/linux-pci/msg51070.html
-- 
Florian
