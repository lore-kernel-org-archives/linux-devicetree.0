From: Bjorn Andersson <bjorn@kryo.se>
Subject: Re: [RFCv2] drm/msm: DT support for 8960/8064
Date: Thu, 17 Jul 2014 09:08:32 -0700
Message-ID: <CAJAp7Ojt3hACTVHEsZz8YMgpVBWkksnyZX1ijB3a1o6_+QgrpA@mail.gmail.com>
References: <1404241055-3579-1-git-send-email-robdclark@gmail.com>
 <1404835244-3735-1-git-send-email-robdclark@gmail.com>
 <CADsdr6O75H33KV7D9fvDEpPfQ6FZ2bH-P84Zf=bjEVuNGbJn9A@mail.gmail.com>
 <CAF6AEGvCiw5d4b68K7kGLY2YrLUEu9ggySZ0Q8HgHGzSW5qX8w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAF6AEGvCiw5d4b68K7kGLY2YrLUEu9ggySZ0Q8HgHGzSW5qX8w@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Rob Clark <robdclark@gmail.com>
Cc: divya ojha <odivya77@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 17, 2014 at 8:29 AM, Rob Clark <robdclark@gmail.com> wrote:
> On Thu, Jul 17, 2014 at 4:10 AM, divya ojha <odivya77@gmail.com> wrote:
[...]
>> Don't we need to have a if(regulator_enabled) check after
>> devm_regulator_get function ?
>> I see a similar test after camera regulator_get function call.
>
> tbh, I'm not 100% sure.
>

Regulators in the Qualcomm platform works by casting votes with the
RPM and there is no way to query the current state of a regulator, so
the regulator code will only return information regarding the Linux
systems votes.

So, we can unfortunately not check this.

This setup also makes it important that if we want a regulator on and
set to a certain voltage then we need to cast our vote with these
values, or some other subsystem might lower it by releasing their
votes.

Regards,
Bjorn
