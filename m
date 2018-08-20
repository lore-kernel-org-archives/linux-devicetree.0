From: pheragu@codeaurora.org
Subject: Re: [PATCH v1 2/2] Embedded USB Debugger (EUD) driver
Date: Mon, 20 Aug 2018 09:59:10 -0700
Message-ID: <cffb39ab91d2922d5eb06fb9cf388d1f@codeaurora.org>
References: <1534464348-8227-1-git-send-email-pheragu@codeaurora.org>
 <1534464348-8227-3-git-send-email-pheragu@codeaurora.org>
 <589f8341-580b-d1d0-5efd-261d8d4821b0@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <589f8341-580b-d1d0-5efd-261d8d4821b0@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Trilok Soni <tsoni@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, ckadabi@codeaurora.org, bryanh@codeaurora.org, psodagud@codeaurora.org, rnayak@codeaurora.org, Satya Durga Srinivasu Prabhala <satyap@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On 2018-08-17 12:47, Trilok Soni wrote:
> Hi Prakruthi,
> 
> On 8/16/2018 5:05 PM, Prakruthi Deepak Heragu wrote:
>> +
>> +#define EUD_INT_VBUS		BIT(2)
>> +#define EUD_INT_CHGR		BIT(3)
>> +#define EUD_INT_SAFE_MODE	BIT(4)
>> +
>> +#define EUD_NR			1
> 
> I don't see any use of EUD_NR in the driver below. Do we need it?
Sorry about that. Will get rid of it.
