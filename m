From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH v2] drm/i2c: tda998x: Change the compatible strings
Date: Sun, 23 Mar 2014 20:03:34 +0000
Message-ID: <20140323200334.GP7528@n2100.arm.linux.org.uk>
References: <20140321115541.01cbbb06@armhf> <532C40B0.3000805@gmail.com>
 <20140323111903.51c73c82@armhf> <532F23F5.6020001@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <532F23F5.6020001@gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, Mar 23, 2014 at 07:12:05PM +0100, Sebastian Hesselbarth wrote:
> On 03/23/2014 11:19 AM, Jean-Francois Moine wrote:
>> On Fri, 21 Mar 2014 14:37:52 +0100
>> Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com> wrote:
>>>>    Required properties;
>>>> -  - compatible: must be "nxp,tda998x"
>>>> +  - compatible: may be "nxp,tda9989", "nxp,tda19988" or "nxp,tda19989"
>>>
>>> There is a "DT is ABI" policy and although there is no mainline Linux
>>> user of current compatible, the correct way would be to deprecate
>>> "nxp,tda998x" and introduce new compatibles.
>>
>> Pratically, what is this way?
>
> Currently, there is no effective way to deprecate a binding or
> compatible. You just add the one(s) that are more sensible and
> you mark the old one as DEPRECATED by simply writing it in the
> binding doc.
>
> The driver should support the old binding at least for a while.

It doesn't need to - it's only been in development trees so far, and
never been in a mainline full release.  Until it does, the binding
does not become stable.

-- 
FTTC broadband for 0.8mile line: now at 9.7Mbps down 460kbps up... slowly
improving, and getting towards what was expected from it.
