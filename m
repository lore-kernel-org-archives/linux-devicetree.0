Return-Path: <SRS0=DyW0=VN=vger.kernel.org=devicetree-owner@kernel.org>
Received: from comms.puri.sm ([159.203.221.185]:40044 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726463AbfGPGLN (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 16 Jul 2019 02:11:13 -0400
Subject: Re: [PATCH 1/3] iio: imu: st_lsm6sdx: move some register definitions
 to sensor_settings struct
References: <20190715131919.31938-1-martin.kepplinger@puri.sm>
 <20190715211033.GA23126@localhost.localdomain>
From: Martin Kepplinger <martin.kepplinger@puri.sm>
Message-ID: <b2ae7b2e-c96e-d819-c24d-0aaffcda3002@puri.sm>
Date: Tue, 16 Jul 2019 08:11:08 +0200
In-Reply-To: <20190715211033.GA23126@localhost.localdomain>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: lorenzo.bianconi83@gmail.com, jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, linux-iio@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 15.07.19 23:10, Lorenzo Bianconi wrote:
>> Move some register definitions to the per-device array of struct
>> st_lsm6dsx_sensor_settings in order to simplify adding new sensor
>> devices to the driver.
>>
>> Also, remove completely unused register definitions.
>>
> 
> Hi Martin,
> 
> just few comments inline
> 
> Regards,
> Lorenzo
> 
>> Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
>> ---
>>  drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.h      |  6 ++++
>>  drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c | 31 ++++++++++++++------
>>  2 files changed, 28 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.h b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.h
>> index c14bf533b66b..f072ac14f213 100644
>> --- a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.h
>> +++ b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.h
>> @@ -196,6 +196,9 @@ struct st_lsm6dsx_ext_dev_settings {
>>  /**
>>   * struct st_lsm6dsx_settings - ST IMU sensor settings
>>   * @wai: Sensor WhoAmI default value.
>> + * @reg_int1_addr: Control Register address for INT1
>> + * @reg_int2_addr: Control Register address for INT2
>> + * @reg_reset_addr: register address for reset/reboot
>>   * @max_fifo_size: Sensor max fifo length in FIFO words.
>>   * @id: List of hw id/device name supported by the driver configuration.
>>   * @decimator: List of decimator register info (addr + mask).
>> @@ -206,6 +209,9 @@ struct st_lsm6dsx_ext_dev_settings {
>>   */
>>  struct st_lsm6dsx_settings {
>>  	u8 wai;
>> +	u8 reg_int1_addr;
>> +	u8 reg_int2_addr;
>> +	u8 reg_reset_addr;
> 
> could you please rename them in int1_addr, int2_addr and reset_addr in order to
> be inline with other st_lsm6dsx_settings fields?
> 

sure. thanks for reviewing!

                             martin
