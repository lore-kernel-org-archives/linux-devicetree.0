From: Olof Johansson <olof@lixom.net>
Subject: Re: [RFC] drm/msm: DT support for 8960/8064
Date: Wed, 2 Jul 2014 10:12:28 -0700
Message-ID: <CAOesGMhaHwr7hon7H+-gEwELS8ZQicsPDWDEoHR6xkrDk3HU0Q@mail.gmail.com>
References: <1404241055-3579-1-git-send-email-robdclark@gmail.com>
 <53B4169C.2030207@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <53B4169C.2030207@codeaurora.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: jcrouse@codeaurora.org
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>, DRI mailing list <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 2, 2014 at 7:26 AM, Jordan Crouse <jcrouse@codeaurora.org> wrote:
> On 07/01/2014 12:57 PM, Rob Clark wrote:
>>
>> diff --git a/Documentation/devicetree/bindings/drm/msm/gpu.txt
>> b/Documentation/devicetree/bindings/drm/msm/gpu.txt
>> new file mode 100644
>> index 0000000..6e33efe
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/drm/msm/gpu.txt
>> @@ -0,0 +1,51 @@
>> +Qualcomm adreno/snapdragon GPU
>> +
>> +Required properties:
>> +- compatible: "qcom,adreno-3xx"
>
>
> 3xx won't always be the only game in town. Not that I have a better name,
> just pointing out that it has a limited shelf life.

Actually, we prefer to avoid "xx" compatible strings. The compatible
should be the first actual device that is part of the xx series, and
newer IP should claim to be compatible with their own version plus the
original one (if they are possible to use with the same exact
programming model and only need extra code to deal with extensions).

That way you'll also have a way to tell them apart in the driver if
you can't derive it out of register contents, etc.


-Olof
