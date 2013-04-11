From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [GIT PULL] ARM: bcm281xx firmware tags
Date: Thu, 11 Apr 2013 01:52:33 -0700
Message-ID: <CAOesGMiiDei3HOop4YkiE2qw1R5opBpRYJEU0Vp3izEyB=r=Mw@mail.gmail.com>
References: <1362451632-18806-1-git-send-email-csd@broadcom.com>
 <201303060631.03782.arnd@arndb.de> <5136F816.2070909@broadcom.com>
 <201303061128.57127.arnd@arndb.de> <5165A271.6060407@broadcom.com>
 <20130411065227.GA31465@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130411065227.GA31465-O5ziIzlqnXUVNXGz7ipsyg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Christian Daudt <csd-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 10, 2013 at 11:52 PM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
> On Wed, Apr 10, 2013 at 10:33:37AM -0700, Christian Daudt wrote:
>> Hi Arnd, Olof,
>>  Please pull the branch below - it contains the BCM281xx l2 cache
>> enabling code.
>>
>>  Thanks,
>>    csd
>>
>>
>> The following changes since commit 07961ac7c0ee8b546658717034fe692fd12eefa9:
>>
>>   Linux 3.9-rc5 (2013-03-31 15:12:43 -0700)
>>
>> are available in the git repository at:
>>
>>   git://github.com/broadcom/bcm11351.git tags/fw-for-3.10
>
> Thanks, pulled into next/soc (local branch name bcm/smc-l2)

Based on later thread about the exynos smc ops, I moved this branch
over to next/firmware instead.


-Olof
