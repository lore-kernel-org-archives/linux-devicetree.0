From: Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH 2/2] ftpm: firmware TPM running in TEE
Date: Wed, 10 Apr 2019 12:04:32 -0400
Message-ID: <20190410160432.GB11568@sasha-vm>
References: <20190402193316.15144-1-sashal@kernel.org>
 <20190402193316.15144-2-sashal@kernel.org>
 <20190403181827.GB17006@linux.intel.com>
 <20190403182728.GA17451@linux.intel.com>
 <20190406153047.GF2935@sasha-vm>
 <20190410112927.GA6586@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190410112927.GA6586@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, peterhuewe@gmx.de, jgg@ziepe.ca, linux-kernel@microsoft.com, bryankel@microsoft.com, thiruan@microsoft.com, suredd@microsoft.com, arnd@arndb.de, gregkh@linuxfoundation.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Apr 10, 2019 at 02:29:27PM +0300, Jarkko Sakkinen wrote:
>On Sat, Apr 06, 2019 at 11:30:47AM -0400, Sasha Levin wrote:
>> On Wed, Apr 03, 2019 at 09:27:28PM +0300, Jarkko Sakkinen wrote:
>> > On Wed, Apr 03, 2019 at 09:18:27PM +0300, Jarkko Sakkinen wrote:
>> > > On Tue, Apr 02, 2019 at 03:33:16PM -0400, Sasha Levin wrote:
>> > > > This patch adds support for a software-only implementation of a TPM
>> > > > running in TEE.
>> > > >
>> > > > There is extensive documentation of the design here:
>> > > > https://www.microsoft.com/en-us/research/publication/ftpm-software-implementation-tpm-chip/ .
>> > > >
>> > > > As well as reference code for the firmware available here:
>> > > > https://github.com/Microsoft/ms-tpm-20-ref/tree/master/Samples/ARM32-FirmwareTPM
>> > > >
>> > > > Signed-off-by: Thirupathaiah Annapureddy <thiruan@microsoft.com>
>> > > > Signed-off-by: Sasha Levin <sashal@kernel.org>
>> > >
>> > > What is the context anyway? I mean tpm_crb already supports fTPM running
>> > > in TZ.
>> >
>> > Might take 2-3 weeks before I have time to go through ftpm1.pdf with
>> > full concentration. I did search through the PDF for CRB and found
>> > zero hits.
>>
>> The fTPM as described in that paper and implemented in practice does not
>> use the CRB interface, thus we can't use tpm_crb to interface with the
>> firmware TPM.
>
>Obviously not but what is the reason of not implementing CRB but instead
>making yet another interface? I mean CRB supports SMC call.
>
>For me this is taking steps back as to the early days when there was
>proprietary intefaces to TPM before TCG came along and stardized.
>
>I'm sure that the TPM implementation itself could be reworked to
>inteface using CRB. It would also be good for ARM as a platform as now
>this new made up interface causes unwanted divergence. I thought that
>throwing ad hoc intefaces everywhere is something that ARM Linux
>community tries to reduce, not increase.

I'm not sure what the original reasons were for not using the CRB
interface. Note that the paper is from a few years ago, and
implementations of this fTPM existed before the paper, so it's very
possible that it just predates CRB.

Either way, there is existing hardware that runs this TPM and I'm trying
to get it out of Microsoft's tree and get it upstream. There's not much
I could do about existing hardware at this point.


--
Thanks,
Sasha
