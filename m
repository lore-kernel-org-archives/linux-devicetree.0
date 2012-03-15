From: H Hartley Sweeten <hartleys-3FF4nKcrg1dE2c76skzGb0EOCMrvLtNR@public.gmane.org>
Subject: RE: [PATCH v4 02/10] pwm: Allow chips to support multiple PWMs.
Date: Wed, 14 Mar 2012 19:42:31 -0500
Message-ID: <ADE657CA350FB648AAC2C43247A983F0020695DB587C@AUSP01VMBX24.collaborationhost.net>
References: <1331740593-10807-1-git-send-email-thierry.reding@avionic-design.de>
 <1331740593-10807-3-git-send-email-thierry.reding@avionic-design.de>
 <ADE657CA350FB648AAC2C43247A983F0020695DB57DC@AUSP01VMBX24.collaborationhost.net>
 <20120314204935.GB12334@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120314204935.GB12334-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wednesday, March 14, 2012 1:50 PM, Thierry Reding wrote:
> * H Hartley Sweeten wrote:
>> On Wednesday, March 14, 2012 8:56 AM, Thierry Reding wrote:
> [...]
>>> +#ifdef CONFIG_DEBUG_FS
>>> +	void			(*dbg_show)(struct pwm_chip *chip,
>>> +					    struct seq_file *s);
>>> +#endif
>> 
>> This doesn't compile...
>> 
>> include/linux/pwm.h:87: warning: 'struct seq_file' declared inside parameter list
>> include/linux/pwm.h:87: warning: its scope is only this definition or declaration, which is probably not what you want
>
> Okay, pwm.h probably needs a seq_file.h include. Thanks for noticing.

Or just a:

struct seq_file;

Regards,
Hartley
