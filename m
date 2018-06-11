Return-Path: <SRS0=a9T3=I5=gmail.com=groeck7@kernel.org>
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v6 12/15] usb: typec: tcpm: set cc for drp toggling attach
References: <1527475967-15201-1-git-send-email-jun.li@nxp.com>
 <1527475967-15201-13-git-send-email-jun.li@nxp.com>
 <20180611122958.GK17155@kuha.fi.intel.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <dcdf2575-c77b-62a8-48d6-ff1d490f0c23@roeck-us.net>
Date: Mon, 11 Jun 2018 06:35:02 -0700
MIME-Version: 1.0
In-Reply-To: <20180611122958.GK17155@kuha.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Li Jun <jun.li@nxp.com>
Cc: robh+dt@kernel.org, gregkh@linuxfoundation.org, cw00.choi@samsung.com, a.hajda@samsung.com, shufan_lee@richtek.com, peter.chen@nxp.com, garsilva@embeddedor.com, gsomlo@gmail.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

On 06/11/2018 05:29 AM, Heikki Krogerus wrote:
> On Mon, May 28, 2018 at 10:52:44AM +0800, Li Jun wrote:
>> In case of drp toggling, we may need set correct cc value for role control
>> after attach as it may never been set.
> 
> Is this something that should be considered as a fix?
> 

The problem with this patch is that it hides a problem. CC should have been set
by the time a port reaches the attached state. The patch means that there is
a state machine path where this does not happen. I'd rather understand that
path and fix the problem where it happens.

Guenter

>> Signed-off-by: Li Jun <jun.li@nxp.com>
>> ---
>>   drivers/usb/typec/tcpm.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/usb/typec/tcpm.c b/drivers/usb/typec/tcpm.c
>> index d885bff..98ea916 100644
>> --- a/drivers/usb/typec/tcpm.c
>> +++ b/drivers/usb/typec/tcpm.c
>> @@ -2599,6 +2599,7 @@ static void tcpm_reset_port(struct tcpm_port *port)
>>   	tcpm_set_attached_state(port, false);
>>   	port->try_src_count = 0;
>>   	port->try_snk_count = 0;
>> +	port->cc_req = TYPEC_CC_OPEN;
>>   	port->supply_voltage = 0;
>>   	port->current_limit = 0;
>>   	port->usb_type = POWER_SUPPLY_USB_TYPE_C;
>> @@ -2831,6 +2832,8 @@ static void run_state_machine(struct tcpm_port *port)
>>   		break;
>>   
>>   	case SRC_ATTACHED:
>> +		if (port->cc_req == TYPEC_CC_OPEN)
>> +			tcpm_set_cc(port, tcpm_rp_cc(port));
>>   		ret = tcpm_src_attach(port);
>>   		tcpm_set_state(port, SRC_UNATTACHED,
>>   			       ret < 0 ? 0 : PD_T_PS_SOURCE_ON);
>> @@ -3004,6 +3007,8 @@ static void run_state_machine(struct tcpm_port *port)
>>   		tcpm_set_state(port, SNK_UNATTACHED, PD_T_PD_DEBOUNCE);
>>   		break;
>>   	case SNK_ATTACHED:
>> +		if (port->cc_req == TYPEC_CC_OPEN)
>> +			tcpm_set_cc(port, TYPEC_CC_RD);
>>   		ret = tcpm_snk_attach(port);
>>   		if (ret < 0)
>>   			tcpm_set_state(port, SNK_UNATTACHED, 0);
> 
