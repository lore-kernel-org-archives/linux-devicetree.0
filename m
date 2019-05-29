From: Richard Gong <richard.gong@linux.intel.com>
Subject: Re: [PATCHv4 3/4] firmware: rsu: document sysfs interface
Date: Wed, 29 May 2019 10:33:27 -0500
Message-ID: <273db79b-97bb-f40c-3dee-fe48633c3edd@linux.intel.com>
References: <1559074833-1325-1-git-send-email-richard.gong@linux.intel.com>
 <1559074833-1325-4-git-send-email-richard.gong@linux.intel.com>
 <20190528231908.GB28886@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190528231908.GB28886@kroah.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, dinguyen@kernel.org, atull@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, sen.li@intel.com, Richard Gong <richard.gong@intel.com>
List-Id: devicetree@vger.kernel.org


Hi Greg,

On 5/28/19 6:19 PM, Greg KH wrote:
> On Tue, May 28, 2019 at 03:20:32PM -0500, richard.gong@linux.intel.com wrote:
>> +What:		/sys/devices/.../stratix10-rsu.0/driver/fail_image
>> +Date:		May 2019
>> +KernelVersion:	5.3
>> +Contact:	Richard Gong <richard.gong@intel.com>
>> +Description:
>> +		(RO) the version number of RSU firmware.
> 
> "fail_image" is the version number?  That doesn't match up with what the
> code says :(
> 
> What happened to the version sysfs file?
> 

Sorry, my typo.

It should be /sys/devices/.../stratix10-rsu.0/driver/version, (RO) the 
version number of RSU firmware.

I will correct that in the next submission.

> thanks,
> 
> greg k-h
> 
Regards,
Richard
