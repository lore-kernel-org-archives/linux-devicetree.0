Return-Path: <SRS0=r4Mj=LY=bitwise.fi=anssi.hannula@kernel.org>
Subject: Re: [PATCH 3/3] can: xilinx_can: add support for Xilinx CAN FD core
References: <20180706141817.19729-1-anssi.hannula@bitwise.fi>
 <20180706141817.19729-4-anssi.hannula@bitwise.fi>
 <CAKfKVtE2Q0k9LLL-tja1Z8SL2i83sQrBo6BbxoM1tgCRZ3004Q@mail.gmail.com>
From: Anssi Hannula <anssi.hannula@bitwise.fi>
Message-ID: <cabc9821-3bb3-7709-d6ac-97bb12ba68e1@bitwise.fi>
Date: Mon, 10 Sep 2018 15:45:51 +0300
MIME-Version: 1.0
In-Reply-To: <CAKfKVtE2Q0k9LLL-tja1Z8SL2i83sQrBo6BbxoM1tgCRZ3004Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Cc: wg@grandegger.com, mkl@pengutronix.de, Michal Simek <michal.simek@xilinx.com>, linux-can@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi,

On 10.9.2018 15:14, Shubhrajyoti Datta wrote:
> On Fri, Jul 6, 2018 at 7:50 PM Anssi Hannula <anssi.hannula@bitwise.fi> wrote:
>> Add support for Xilinx CAN FD core.
>>
>> The major difference from the previously supported cores is that there
>> are TX mailboxes instead of a TX FIFO and the RX FIFO access method is
>> different.
>>
>> We only transmit one frame at a time to prevent the HW from reordering
>> frames (it uses CAN ID priority order).
>>
>> Support for CAN FD protocol is not added yet.
>>
>> v2: Removed unnecessary "rx-mode" DT property and wrapped some long
>>     lines.
>>
>> Signed-off-by: Anssi Hannula <anssi.hannula@bitwise.fi>
>> Cc: Michal Simek <michal.simek@xilinx.com>
>> ---
>>  drivers/net/can/xilinx_can.c | 303 ++++++++++++++++++++++++++++++++++++-------
>>  1 file changed, 259 insertions(+), 44 deletions(-)
[...]
>>
>> +static const struct can_bittiming_const xcan_bittiming_const_canfd = {
>> +       .name = DRIVER_NAME,
>> +       .tseg1_min = 1,
>> +       .tseg1_max = 64,
>> +       .tseg2_min = 1,
>> +       .tseg2_max = 16,
>> +       .sjw_max = 16,
>> +       .brp_min = 1,
>> +       .brp_max = 256,
>> +       .brp_inc = 1,
>> +};
> Where is this used?
[...]
>
>> +
>> +static const struct xcan_devtype_data xcan_canfd_data = {
>> +       .flags = XCAN_FLAG_EXT_FILTERS |
>> +                XCAN_FLAG_RXMNF |
>> +                XCAN_FLAG_TX_MAILBOXES |
>> +                XCAN_FLAG_RX_FIFO_MULTI,
>> +       .bittiming_const = &xcan_bittiming_const,
> Did you intend to use xcan_bittiming_const_canfd here ?
>

Yes, good catch. I'll test on HW and then post a patch, or you can do so
if you have one ready already.

-- 
Anssi Hannula / Bitwise Oy
+358 503803997
