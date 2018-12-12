From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 6/6] misc: fastrpc: Add support for compat ioctls
Date: Wed, 12 Dec 2018 11:44:05 +0000
Message-ID: <864aaef3-8d60-3beb-ce20-a9f41f78a32f@linaro.org>
References: <20181207163513.16412-1-srinivas.kandagatla@linaro.org>
 <20181207163513.16412-7-srinivas.kandagatla@linaro.org>
 <20181212105932.GA1990@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181212105932.GA1990@kroah.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: robh+dt@kernel.org, arnd@arndb.de, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org, bkumar@qti.qualcomm.com, thierry.escande@linaro.org
List-Id: devicetree@vger.kernel.org

Thanks for the comments,

On 12/12/18 10:59, Greg KH wrote:
>> This patch adds support for compat ioctl from 32 bits userland to
>> Qualcomm fastrpc driver.
> Ick, why?
> 
> Why not just fix up your ioctl structures to not need that at all?  For
> new code being added to the kernel, there's no excuse to have to have
> compat structures anymore, just make your api sane and all should be
> fine.

Yes, I did try that after comments from Arnd,


> 
> What prevents you from doing that and requiring compat support?
> 
I removed most of the compat IOCTLS except this one.
The reason is that this ioctl takes arguments which can vary in number 
for each call. So args are passed as pointer to structure, rather than 
fixed size. I could not find better way to rearrange this to give a 
fixed size data structure. In theory number of arguments can vary from 
0-255 for both in & out.

current data structure looks like this:

struct fastrpc_invoke_args {
	__s32 fd;
	size_t length;
	void *ptr;
};

struct fastrpc_invoke {
	__u32 handle;
	__u32 sc;
	struct fastrpc_invoke_args *args;
};

Other option is to split this IOCTL into 3 parts
SET_INVOKE_METHOD, SET_INVOKE_ARGS and INVOKE
with some kinda handle to bind these three.

with below structures:
struct fastrpc_invoke {
	__u32 handle;
	__u32 sc;
};

struct fastrpc_invoke_arg {
	__s32 fd;
	__u64 length;
	__u64 ptr;
};
I can try this and see how this works before I send next version of patch!


--srini
> thanks,
> 
> greg k-h
