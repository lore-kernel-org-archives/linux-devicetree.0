From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v3 4/7] iio: trigger: Add periodic polling to SYSFS
 trigger
Date: Sat, 8 Aug 2015 18:26:47 +0100
Message-ID: <55C63BD7.3040401@kernel.org>
References: <1438174469-19054-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <1438174642-19258-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <55C4B5CB.9060400@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <55C4B5CB.9060400@metafoo.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Lars-Peter Clausen <lars@metafoo.de>, Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Cc: Hartmut Knaack <knaack.h@gmx.de>, Peter Meerwald <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, cory.tusar@pid1solutions.com, Daniel Baluta <daniel.baluta@intel.com>
List-Id: devicetree@vger.kernel.org

On 07/08/15 14:42, Lars-Peter Clausen wrote:
> On 07/29/2015 02:57 PM, Vladimir Barinov wrote:
>> Add periodic polling functionality to SYSFS trigger
> 
> Daniel's hrtimer trigger should be used for this instead of modifying the
> sysfs trigger timer. See https://lkml.org/lkml/2015/5/8/367
> 
> He said he'll send out a new version shortly.
Agreed.  I'd like to keep these two trigger types separate as they
conceptually are quite different things.

Jonathan
