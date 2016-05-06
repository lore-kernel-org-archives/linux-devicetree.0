From: Reza Arbab <arbab@linux.vnet.ibm.com>
Subject: Re: [PATCH] of: fix device compatibility scoring
Date: Fri, 6 May 2016 10:10:32 -0500
Message-ID: <20160506151031.GB1442@arbab-laptop.austin.ibm.com>
References: <1462473048-10001-1-git-send-email-arbab@linux.vnet.ibm.com>
 <CAL_JsqJ99yTTbYyroV+QixNnmyv0YQyveC=VG-z5iut-43tUhA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqJ99yTTbYyroV+QixNnmyv0YQyveC=VG-z5iut-43tUhA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>, Kevin Hao <haokexin@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 05, 2016 at 02:47:18PM -0500, Rob Herring wrote:
>This matching is very sensitive to changes. Can you please describe
>what conditions don't work for you and add a test case for that
>condition to the unit test.

Ah, thanks for pointing out the unit test.

Looking at the test cases there cleared up the misunderstanding I had 
which led me to suggest the patch. It does seem that the 
short-circuiting in __of_device_is_compatible() is intentional.

Please disregard. Sorry for the noise.

-- 
Reza Arbab
