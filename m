From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [RFC PATCH 2/6] char: fastrpc: Add Qualcomm fastrpc basic driver
 model
Date: Fri, 30 Nov 2018 16:19:00 +0000
Message-ID: <f90fa38d-11a6-0767-7e42-b9a6b8ede85a@linaro.org>
References: <20181130104657.14875-1-srinivas.kandagatla@linaro.org>
 <20181130104657.14875-3-srinivas.kandagatla@linaro.org>
 <20181130161324.GA8031@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181130161324.GA8031@kroah.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: robh+dt@kernel.org, arnd@arndb.de, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org, bkumar@qti.qualcomm.com, thierry.escande@linaro.org
List-Id: devicetree@vger.kernel.org

Thanks for the comments!

On 30/11/18 16:13, Greg KH wrote:
>> +						"sdsp", "cdsp"};
>> +static dev_t fastrpc_major;
> Why do you need a whole major number for this?  Why not just use the
Not really!
> misc interface instead?

Sure, I will give that a go!
> 

--srini
