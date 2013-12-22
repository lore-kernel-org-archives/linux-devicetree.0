From: Loc Ho <lho@apm.com>
Subject: Re: [PATCH V2 0/4] misc: xgene: Add support for APM X-Gene SoC Queue
 Manager/Traffic Manager
Date: Sat, 21 Dec 2013 17:00:51 -0800
Message-ID: <CAPw-ZTnsu_EmOW3aZTVKAVjQsdi8qMy95y2ZcYxzgVrjGkirTA@mail.gmail.com>
References: <1387594651-25771-1-git-send-email-rapatel@apm.com>
	<201312212111.40576.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <201312212111.40576.arnd@arndb.de>
Sender: netdev-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Ravi Patel <rapatel@apm.com>, gregkh@linuxfoundation.org, davem@davemloft.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Jon Masters <jcm@redhat.com>, "patches@apm.com" <patches@apm.com>, Keyur Chudgar <kchudgar@apm.com>
List-Id: devicetree@vger.kernel.org

Hi Arnd,

On Sat, Dec 21, 2013 at 12:11 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Saturday 21 December 2013, Ravi Patel wrote:
>> This patch adds support for APM X-Gene SoC Queue Manager/Traffic Manager.
>>  QMTM is required by APM X-Gene SoC Ethernet, PktDMA (XOR Engine) and
>>  Security Engine subsystems. All subsystems communicate with QMTM using
>>  messages which include information about the work to be performed and
>>  the location of associated data buffers.
>
> Please describe here what the purpose of the qmtm is, as this is not
> entirely clear from the code.
>
> In particular, please describe how this differs from a dmaengine driver
> and why it is not possible to extend the dma slave API to describe qmtm
> as a dma engine.
>
[Loc Ho]
If the QM driver implements the DMA API, what about the actual DMA
engine driver which interfaces with this QM driver. We would have DMA
client interfaces with the X-Gene DMA driver (not available yet) via
DMA API which in turn interfaces with this QM driver via DMA API.
Won't this be kind of awkward? Also, the QM only manage messages (or
descriptors) which are 32-bytes or 64-bytes. It doesn't actually do
any data transfer of various sizes.

-Loc
