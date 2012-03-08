From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [GIT PULL v4] ARM: kirkwood: fdt conversion progress
Date: Thu, 8 Mar 2012 09:15:08 -0800
Message-ID: <CAOesGMh2etdQSOjktDGcWGfnsMhyFnVuebWRQeYuR6fvm1_DSA@mail.gmail.com>
References: <20120307221012.GH5050@titan.lakedaemon.net>
 <201203081610.21493.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201203081610.21493.arnd-r2nGTMty4D4@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, michael-QKn5cuLxLXY@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On Thu, Mar 8, 2012 at 8:10 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Wednesday 07 March 2012, Jason Cooper wrote:
>> The following changes since commit d65b4e98d7ea3038b767b70fe8be959b2913f=
16d:
>>
>> =A0 Linux 3.3-rc3 (2012-02-08 19:21:53 -0800)
>>
>> are available in the git repository at:
>> =A0 git://git.infradead.org/users/jcooper/linux-kirkwood.git kirkwood_dt
>>
>> ---
>> Arnd,
>>
>> My first two should match up with what you have already, the only
>> outlier is that Jean-Christophe's patch is needed, but I don't think
>> everyone agrees on it yet.
>>
>
> Right now, Olof is handling the pull requests. I would suggest that he
> can use your branch to replace the current staging branch but still keep
> it in staging until everyone agrees or you replace it with a better versi=
on.

Jason,

Looking at the new pull request I see some differences in device
support. For example, the DT conversion of orion-spi and wdt is not in
the new branch.

Is that intentional? If not I'll hold off replacing your branch.


-Olof
