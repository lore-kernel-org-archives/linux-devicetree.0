Return-Path: <SRS0=j10c=IJ=codeaurora.org=kramasub@kernel.org>
Subject: Re: [PATCH v5 3/5] i2c: i2c-qcom-geni: Add bus driver for the
 Qualcomm GENI I2C controller
References: <1521836461-6515-1-git-send-email-kramasub@codeaurora.org>
 <1521836461-6515-4-git-send-email-kramasub@codeaurora.org>
 <20180521204924.4ldbke6udjshdz2k@katana>
From: Karthik Ramasubramanian <kramasub@codeaurora.org>
Message-ID: <bae1c27a-fdc4-c33b-63d5-c776e9c0b9c8@codeaurora.org>
Date: Tue, 22 May 2018 08:52:54 -0600
MIME-Version: 1.0
In-Reply-To: <20180521204924.4ldbke6udjshdz2k@katana>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Wolfram Sang <wsa@the-dreams.de>
Cc: corbet@lwn.net, andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, evgreen@chromium.org, acourbot@chromium.org, swboyd@chromium.org, dianders@chromium.org, Sagar Dharia <sdharia@codeaurora.org>, Girish Mahadevan <girishm@codeaurora.org>
List-ID: <devicetree@vger.kernel.org>



On 5/21/2018 2:49 PM, Wolfram Sang wrote:
> Hi,
> 
> On Fri, Mar 23, 2018 at 02:20:59PM -0600, Karthikeyan Ramasubramanian wrote:
>> This bus driver supports the GENI based i2c hardware controller in the
>> Qualcomm SOCs. The Qualcomm Generic Interface (GENI) is a programmable
>> module supporting a wide range of serial interfaces including I2C. The
>> driver supports FIFO mode and DMA mode of transfer and switches modes
>> dynamically depending on the size of the transfer.
>>
>> Signed-off-by: Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
>> Signed-off-by: Sagar Dharia <sdharia@codeaurora.org>
>> Signed-off-by: Girish Mahadevan <girishm@codeaurora.org>
> 
> Is one of these people interested in maintaining this driver? Then, an
> entry for MAINTAINERS would be needed, too. (Same goes for
> drivers/soc/qcom/ IMHO, but this is not my realm, so just saying)
One of us will maintain this driver and I will update the MAINTAINERS
appropriately.
> 
>> +static const struct geni_i2c_err_log gi2c_log[] = {
>> +	[GP_IRQ0] = {-EINVAL, "Unknown I2C err GP_IRQ0"},
>> +	[NACK] = {-ENOTCONN, "NACK: slv unresponsive, check its power/reset-ln"},
>> +	[GP_IRQ2] = {-EINVAL, "Unknown I2C err GP IRQ2"},
>> +	[BUS_PROTO] = {-EPROTO, "Bus proto err, noisy/unepxected start/stop"},
>> +	[ARB_LOST] = {-EBUSY, "Bus arbitration lost, clock line undriveable"},
>> +	[GP_IRQ5] = {-EINVAL, "Unknown I2C err GP IRQ5"},
>> +	[GENI_OVERRUN] = {-EIO, "Cmd overrun, check GENI cmd-state machine"},
>> +	[GENI_ILLEGAL_CMD] = {-EILSEQ, "Illegal cmd, check GENI cmd-state machine"},
>> +	[GENI_ABORT_DONE] = {-ETIMEDOUT, "Abort after timeout successful"},
>> +	[GENI_TIMEOUT] = {-ETIMEDOUT, "I2C TXN timed out"},
>> +};
> 
> Please check Documentation/i2c/fault-codes for better -ERRNO values,
> especially for NACK and ARB_LOST.
I will check the fault-codes and fix the error codes here.
> 
> Rest looks good from a glimpse.
> 
> Thanks,
> 
>    Wolfram
> 
Regards,
Karthik.
-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
